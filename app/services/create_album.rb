class CreateAlbum
	ALPHABET_SQID = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'.freeze

	def initialize(params, user_id, route_helper)
		@params = params
		@user_id = user_id
		@route_helper = route_helper
	end

	attr_accessor :params, :user_id, :album

	def call
		initialize_album
		attach_banner_image
		generate_qrcode

		return album if album.save
	end

	private

	def initialize_album
		@album = Album.new(
			unique_id: generate_random_id,
			title: params[:title],
			category: params[:category],
			description: params[:description],
			start_date: params[:start_date],
			user_id:,
		)
	end

	def attach_banner_image
		return unless params[:banner].present?

		blob = ActiveStorage::Blob.create_and_upload!(
			io: params[:banner],
			filename: params[:banner]&.original_filename,
			content_type: params[:banner].content_type
		)

		album.banner.attach(blob)

		unless album.banner.attached?
			raise StandardError, 'Falha ao enviar a imagem'
		end
	end

	def generate_qrcode
		host = Rails.application.routes.default_url_options[:host]
		qrcode = RQRCode::QRCode.new("#{host}#{@route_helper.call(album.unique_id)}")

		qrcode_png = qrcode.as_png(
			bit_depth: 1,
			border_modules: 4,
			color_mode: ChunkyPNG::COLOR_GRAYSCALE,
			color: "black",
			file: nil,
			fill: "white",
			module_px_size: 6,
			resize_exactly_to: false,
			resize_gte_to: false,
			size: 180
		)

		album.qrcode.attach(
      io: StringIO.new(qrcode_png.to_s),
      filename: "qrcode-#{album.unique_id}.png",
      content_type: 'image/png',
		)
	end

	def generate_random_id
		sqids = Sqids.new(alphabet: ALPHABET_SQID)

		loop do
			generated_id = sqids.encode([Time.now.to_i, rand(1..1_000_000)])
			decoded_numbers = sqids.decode(generated_id)

			if generated_id == sqids.encode(decoded_numbers)
				return generated_id
			end
		end
	end
end