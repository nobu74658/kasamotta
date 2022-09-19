const functions = require('firebase-functions');
const admin = require('firebase-admin');
const express = require('express');
const cors = require('cors');
const nanoid = require('nanoid');
admin.initializeApp();
var fireStore = admin.firestore();

exports.date = functions.https.onRequest(async (req, res) => {
console.log('テストスタート');
  // ...
  console.log("res.end()の前");
  const docRef = db.collection('users').doc(nanoid());
  await docRef.set({
    name: 'taro',
    time: 9,
    mail: 'hogehoge@hoge.com'
  });
  const aTuringRef = db.collection('users').doc(nanoid());
  await aTuringRef.set({
    name: 'hana',
    time: 6,
    weather: 'strong',
    mail: 'hoge@hogehogehoge.com'
  });

    if(req.body.index==1){
      res.send("テスト1終了");
    } else {
      res.json({"test": "テスト"})
    }
    console.log("res.end()の後ろ");
});

//一定時間ごとに実行する
//exports.scheduledFunction = functions.pubsub.schedule('every 5 minutes').onRun(async (context) =>  {
//  console.log('This will be run every 5 minutes!');
//
//  await admin.messaging().sendMulticast({
//    tokens: ["eSeBpWinEUVBt0doHjIM6K:APA91bHJBj6FgxdoJ2lU2y1nZCMNm1-Hra5UjJE8ZFs4HwFxc-uUgHmgw7J8HO0zeMjmGZQMpaBtkCXOOb7hzc56qQdnp9m3um5mNABKcnvG7ceabObjPQ_RI3ndw9-jb412n6RmvD--"],
//    notification: {
//      title: "Weather Warning!",
//      body: "A new weather warning has been issued for your location.",
//      imageUrl: "https://cdn.hinatazaka46.com/files/14/diary/official/member/moblog/202006/mobC44KLW.jpg",
//    },
//  });
//  console.log('通知の送信が終了');
//
//  return null;
//});

exports.hogehoge = functions.region('asia-northeast1').https.onRequest(async (data) => {
  console.log("テスト開始");
  // var fcmTokens = fireStore.collection('users').where();
  await fcmTokens.get().then((doc) => {
    if (!doc.exists) {
      Response.send('No such document!')
    } else {
      Response.send(doc.data())
    }
  })
  .catch(err => {
    Response.send('not found')
  })
await admin.messaging().sendMulticast({
  tokens: ["eSeBpWinEUVBt0doHjIM6K:APA91bHJBj6FgxdoJ2lU2y1nZCMNm1-Hra5UjJE8ZFs4HwFxc-uUgHmgw7J8HO0zeMjmGZQMpaBtkCXOOb7hzc56qQdnp9m3um5mNABKcnvG7ceabObjPQ_RI3ndw9-jb412n6RmvD--"],
  notification: {
    title: "Weather Warning!",
    body: "A new weather warning has been issued for your location.",
    imageUrl: "https://cdn.hinatazaka46.com/files/14/diary/official/member/moblog/202006/mobC44KLW.jpg",
  },
});
console.log('通知の送信が終了');

return null;
})

exports.hoge = functions.region('asia-northeast1').https.onCall(async (data) => {
    console.log("テスト開始");
    // var fcmTokens = fireStore.collection('users').where();
    await fcmTokens.get().then((doc) => {
      if (!doc.exists) {
        Response.send('No such document!')
      } else {
        Response.send(doc.data())
      }
    })
    .catch(err => {
      Response.send('not found')
    })
  await admin.messaging().sendMulticast({
    tokens: ["eSeBpWinEUVBt0doHjIM6K:APA91bHJBj6FgxdoJ2lU2y1nZCMNm1-Hra5UjJE8ZFs4HwFxc-uUgHmgw7J8HO0zeMjmGZQMpaBtkCXOOb7hzc56qQdnp9m3um5mNABKcnvG7ceabObjPQ_RI3ndw9-jb412n6RmvD--"],
    notification: {
      title: "Weather Warning!",
      body: "A new weather warning has been issued for your location.",
      imageUrl: "https://cdn.hinatazaka46.com/files/14/diary/official/member/moblog/202006/mobC44KLW.jpg",
    },
  });
  console.log('通知の送信が終了');

  return null;
});