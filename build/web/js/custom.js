function wcqib_refresh_quantity_increments() {
    jQuery("div.quantity:not(.buttons_added), td.quantity:not(.buttons_added)").each(function(e, t) {
        var i = jQuery(t);
        i.addClass("buttons_added"), i.children().first().before('<input type="button" value="-" class="minus" />'), i.children().last().after('<input type="button" value="+" class="plus" />');
    });
}
String.prototype.getDecimals || (String.prototype.getDecimals = function() {
    var e = ("" + this).match(/(?:\.(\d+))?(?:[eE]([+-]?\d+))?$/);
    return e ? Math.max(0, (e[1] ? e[1].length : 0) - (e[2] ? +e[2] : 0)) : 0;
}), jQuery(document).ready(function() {
    wcqib_refresh_quantity_increments();
}), jQuery(document).on("updated_wc_div", function() {
    wcqib_refresh_quantity_increments();
}), jQuery(document).on("click", ".plus, .minus", function() {
    var e = jQuery(this).closest(".quantity").find(".qty"),
        t = parseFloat(e.val()),
        i = parseFloat(e.attr("max")),
        o = parseFloat(e.attr("min")),
        n = e.attr("step");
    t && "" !== t && "NaN" !== t || (t = 0), "" !== i && "NaN" !== i || (i = ""), "" !== o && "NaN" !== o || (o = 0), "any" !== n && "" !== n && void 0 !== n && "NaN" !== parseFloat(n) || (n = 1), jQuery(this).is(".plus") ? i && t >= i ? e.val(i) : e.val((t + parseFloat(n)).toFixed(n.getDecimals())) : o && t <= o ? e.val(o) : t > 0 && e.val((t - parseFloat(n)).toFixed(n.getDecimals())), e.trigger("change");
}), $(document).ready(function() {
    $(".like-icon, .like-button").on("click", function(e) {
        e.preventDefault(), $(this).toggleClass("liked"), $(this).children(".like-icon").toggleClass("liked");
    });
}), $(document).ready(function() {
    $(".cart-icon, .cart-button").on("click", function(e) {
        e.preventDefault(), $(this).toggleClass("clicked"), $(this).children(".cart-icon").toggleClass("clicked");
    });
}), $(document).ready(function() {
    var e = function() {
        $(".navbar-nav").css("max-height", document.documentElement.clientHeight - 8e3);
    };
    e(), $(window).resize(function() {
        e();
    }), $(".navbar .navbar-toggler").on("click", function() {
        e();
    }), $(".navbar-toggler, .overlay").on("click", function() {
        $(".mobileMenu, .overlay").toggleClass("open"), console.log("clicked");
    });
}), $(".ui.dropdown").dropdown(), $(".dropdown").dropdown({
    transition: "drop",
    on: "hover"
}), $(".ui.modal").modal({
    blurring: !0
}).modal("show"), $(".menu .item").tab(), $(".ui.checkbox").checkbox(), $(".enable.button").on("click", function() {
    $(this).nextAll(".checkbox").checkbox("enable");
}), $('input[name="paymentmethod"]').on("click", function() {
    var e = $(this).attr("value");
    $(".return-departure-dts").slideUp(), $('[data-method="' + e + '"]').slideDown();
}), $(".product_countdown-timer").each(function() {
    var e = $(this);
    e.countdown(e.data("countdown"), function(e) {
        $(this).text(e.strftime("%D days %H:%M:%S"));
    });
}), $(".offers-banner").owlCarousel({
    loop: !0,
    margin: 30,
    nav: !1,
    dots: !1,
    autoplay: !0,
    autoplayTimeout: 3e3,
    autoplayHoverPause: !0,
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 2
        },
        1000: {
            items: 2
        },
        1200: {
            items: 3
        },
        1400: {
            items: 3
        }
    }
}), $(".cate-slider").owlCarousel({
    loop: !0,
    margin: 30,
    nav: !0,
    dots: !1,
    navText: ["<i class='uil uil-angle-left'></i>", "<i class='uil uil-angle-right'></i>"],
    responsive: {
        0: {
            items: 2
        },
        600: {
            items: 2
        },
        1000: {
            items: 4
        },
        1200: {
            items: 6
        },
        1400: {
            items: 6
        }
    }
}), $(".featured-slider").owlCarousel({
    items: 8,
    loop: !1,
    margin: 10,
    nav: !0,
    dots: !1,
    navText: ["<i class='uil uil-angle-left'></i>", "<i class='uil uil-angle-right'></i>"],
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 2
        },
        1000: {
            items: 3
        },
        1200: {
            items: 4
        },
        1400: {
            items: 5
        }
    }
}), $(".date-slider").owlCarousel({
    loop: !1,
    margin: 10,
    nav: !1,
    dots: !1,
    responsive: {
        0: {
            items: 3
        },
        600: {
            items: 4
        },
        1000: {
            items: 5
        },
        1200: {
            items: 6
        },
        1400: {
            items: 7
        }
    }
}), $(".life-slider").owlCarousel({
    loop: !0,
    margin: 30,
    nav: !0,
    dots: !1,
    autoplay: !0,
    autoplayTimeout: 3e3,
    autoplayHoverPause: !0,
    navText: ["<i class='uil uil-angle-left'></i>", "<i class='uil uil-angle-right'></i>"],
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 2
        },
        1000: {
            items: 2
        },
        1200: {
            items: 3
        },
        1400: {
            items: 3
        }
    }
}), $(".testimonial-slider").owlCarousel({
    loop: !0,
    margin: 30,
    nav: !0,
    dots: !1,
    autoplay: !0,
    autoplayTimeout: 3e3,
    autoplayHoverPause: !0,
    navText: ["<i class='uil uil-angle-left'></i>", "<i class='uil uil-angle-right'></i>"],
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 2
        },
        1000: {
            items: 2
        },
        1200: {
            items: 3
        },
        1400: {
            items: 3
        }
    }
}), $(".team-slider").owlCarousel({
    loop: !0,
    margin: 30,
    nav: !1,
    dots: !1,
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 2
        },
        1000: {
            items: 3
        },
        1200: {
            items: 4
        },
        1400: {
            items: 4
        }
    }
}), 

$(document).keydown(function(e) {
    return 123 !== e.keyCode && (!(e.ctrlKey && e.shiftKey && 73 === e.keyCode || e.ctrlKey && e.shiftKey && 74 === e.keyCode) && void 0);
});

$(".showMore").slice(0,12).show(); //showing 12 div
$(".loadMore").fadeIn();  

$(".loadMore").on("click", function() {
    $(".showMore:hidden").slice(0,12).show(); //showing 12 hidden div on click
    if ($(".showMore:hidden").length === 0) {
        $(".loadMore").fadeOut(); //this will hide
        //button when length is 0
    }
});

