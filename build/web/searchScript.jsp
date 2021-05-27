<%-- 
    Document   : searchScript
    Created on : Mar 1, 2021, 5:43:04 PM
    Author     : Sendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {
                $('.Itemshop').keyup(function () {
//                alert();
                    var search = $('.Itemshop').val().trim();
                    if (search.length > 0) {
                        $('.showList').addClass('dc2').removeClass('dc1');

                    } else {
                        $('.showList').addClass('dc1').removeClass('dc2').removeAttr('style');
                    }
                    if (search !== '' && search !== null) {
                        $.ajax({
                            type: 'POST',
                            url: 'record.jsp',
                            data: {key: search},
                            success: function (data) {
                                $('.showList').html(data);
                            }
                        });
                    } else {
                        $('.showList').html('');
                    }
                });
            });
            $(document).ready(function () {
                $('#Itemshop1').keyup(function () {
//                alert();
                    var search = $('#Itemshop1').val();
                    if (search !== '' && search !== null) {
                        $.ajax({
                            type: 'POST',
                            url: 'record.jsp',
                            data: {key: search},
                            success: function (data) {
                                $('#showList1').html(data);
                            }
                        });
                    } else {
                        $('#showList1').html('');
                    }
                });
            });
            $(document).ready(function () {
                $('#Itemshop2').keyup(function () {
//                alert();
                    
                    var search = $('#Itemshop2').val();
                    if (search !== '' && search !== null) {
                        $.ajax({
                            type: 'POST',
                            url: 'record.jsp',
                            data: {key1: search},
                            success: function (data) {
                                $('#showList2').html(data);
                            }
                        });
                    } else {
                        $('#showList2').html('');
                    }
                });
            });
        </script>

    </body>
</html>
