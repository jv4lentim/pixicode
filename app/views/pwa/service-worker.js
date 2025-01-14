// Add a service worker for processing Web Push notifications:
//
// self.addEventListener("push", async (album) => {
//   const { title, options } = await album.data.json()
//   album.waitUntil(self.registration.showNotification(title, options))
// })
//
// self.addEventListener("notificationclick", function(album) {
//   album.notification.close()
//   album.waitUntil(
//     clients.matchAll({ type: "window" }).then((clientList) => {
//       for (let i = 0; i < clientList.length; i++) {
//         let client = clientList[i]
//         let clientPath = (new URL(client.url)).pathname
//
//         if (clientPath == album.notification.data.path && "focus" in client) {
//           return client.focus()
//         }
//       }
//
//       if (clients.openWindow) {
//         return clients.openWindow(album.notification.data.path)
//       }
//     })
//   )
// })
