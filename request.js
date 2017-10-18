var url = 'http://localhost:9292';
var xhr = new XMLHttpRequest();

xhr.open('POST', url);
xhr.send('Hi, this is some message!');
