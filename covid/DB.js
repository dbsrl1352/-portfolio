const mysql = require('mysql');

const connectionInfo = {
    user:'yy_20101',
    password:'1234',
    host:'gondr.asuscomm.com',
    database:'yy_20101'
};

const con = mysql.createConnection(connectionInfo);

module.exports.con = con;