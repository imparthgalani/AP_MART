/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//$(document).ready(function () {
//    var Url = location.href;
//    $("#facebook").attr("href", "https://www.facebook.com/sharer.php?url=" + Url);
//    $("#twitter").attr("href", "https://twitter.com/share?url=" + Url);
//    $("#whatsapp").attr("href", "https://api.whatsapp.com/send?text=" + Url);
//    $("#twitter").attr("href", "https://twitter.com/share?url=" + Url);
//    $("#googleplus").attr("href", "https://plus.google.com/share?url=" + Url);
//    $("#pinterest").attr("href", "https://pinterest.com/pin/create/bookmarklet?url=" + Url);
//    $("#linkedin").attr("href", "https://www.linkedin.com/shareArticle?url=" + Url);    
//});

$("#share").jsSocials({
    url: $(this).data('url'),
    text: "Share Your Friends...",
    showLabel: false,
    showCount: false,
    shares: [ "whatsapp", "email", "facebook", "twitter",'googleplus', "pinterest"]
});