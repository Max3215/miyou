(function($) {
    $.fn.FlashPlayer = function(options) {
        var settings = $.extend(true, jQuery.fn.FlashPlayer.defaultSettings, options);
        return this.each(function() {
            if (settings.flashFile != "") {
                $(this).css({ "visibility": "visible" });
                $(this).html('<embed type="application/x-shockwave-flash" autostart="' + settings.autostart + '" src="' + settings.flashFile + '" width="' + settings.width + '" height="' + settings.height + '" style="undefined" quality="high" wmode="' + settings.wmode + '" allowfullscreen="' + settings.allowfullscreen + '">');
            }
        });
    };
    $.fn.FlashPlayer.defaultSettings = {
        flashFile: "", wmode: "transparent", autostart: "0", width: "500", height: "400", allowfullscreen: "true"
    };

    $.fn.FLVPlayer = function(options) {
        var settings = $.extend(true, $.fn.FLVPlayer.defaultSettings, options);
        return this.each(function() {
            if (settings.vodFile != "") {
                $(this).css({ "visibility": "visible" });
                if (settings.autostart == "yes") {
                    $(this).html('<embed type="application/x-shockwave-flash" src="/javascript/swf/FLVPlayer.swf" width="' + settings.width + '" height="' + settings.height + '" style="undefined" id="single" name="single" quality="high" allowfullscreen="' + settings.allowfullscreen + '" flashvars="autostart=' + settings.autostart + '&amp;file=' + settings.vodFile + '&amp;image=' + settings.loading + '&amp;backcolor=' + settings.backcolor + '&amp;frontcolor=' + settings.frontcolor + '&amp;lightcolor=' + settings.lightcolor + '&amp;width=' + settings.width + '&amp;height=' + settings.height + '">');
                }
                if (settings.autostart == "no") {
                    $(this).html('<embed type="application/x-shockwave-flash" src="/javascript/swf/FLVPlayer.swf" width="' + settings.width + '" height="' + settings.height + '" style="undefined" id="single" name="single" quality="high" allowfullscreen="' + settings.allowfullscreen + '" flashvars="file=' + settings.vodFile + '&amp;image=' + settings.loading + '&amp;backcolor=' + settings.backcolor + '&amp;frontcolor=' + settings.frontcolor + '&amp;lightcolor=' + settings.lightcolor + '&amp;width=' + settings.width + '&amp;height=' + settings.height + '">');
                }
            }
        });
    };
    $.fn.FLVPlayer.defaultSettings = {
        vodFile: "", autostart: "no", width: "500", height: "400", allowfullscreen: "true",
        loading: "/javascript/swf/loading.gif",
        backcolor: "0x000000", frontcolor: "0xCCCCCC", lightcolor: "0x557722"
    };
    $.fn.MP3Player = function(options) {
        var settings = jQuery.extend(true, jQuery.fn.MP3Player.defaultSettings, options);
        return this.each(function() {
            if (settings.soundFile != "") {
                $(this).css({ "visibility": "visible" });
                $(this).html('<embed type="application/x-shockwave-flash" src="/javascript/swf/MP3Player.swf" height="' + settings.height + '" width="' + settings.width + '"  wmode="transparent" style="undefined" name="move" quality="high" flashvars="autostart=' + settings.autostart + '&amp;bg=' + settings.bg + '&amp;leftbg=' + settings.leftbg + '&amp;lefticon=' + settings.lefticon + '&amp;rightbg=' + settings.rightbg + '&amp;rightbghover=' + settings.rightbghover + '&amp;righticon=' + settings.righticon + '&amp;righticonhover=' + settings.righticonhover + '&amp;text=' + settings.text + '&amp;slider=' + settings.slider + '&amp;track=' + settings.track + '&amp;border=' + settings.border + '&amp;loader=' + settings.loader + '&amp;soundFile=' + settings.soundFile + '">');
            }
        });
    };
    $.fn.MP3Player.defaultSettings = {
        autostart: "no", soundFile: "", width: "290", height: "24",
        bg: "0xCDDFF3", leftbg: "0x357DCE", lefticon: "0xF2F2F2", rightbg: "0xF06A51",
        rightbghover: "0xAF2910", righticon: "0xF2F2F2", righticonhover: "0xFFFFFF",
        text: "0x357DCE", slider: "0x357DCE", track: "0xFFFFFF", border: "0xFFFFFF", loader: "0xAF2910"
    };
})(jQuery);

$(document).ready(function() {
    $(".FlashPlayer").each(function() {
        var start = $(this).attr("autostart");
        if (start == "") { start == "0"; }
        var file = $(this).attr("file");
        var w = $(this).attr("width");
        if (w == "") { w = "500"; }
        var h = $(this).attr("height");
        if (h == "") { h = "400"; }
        $(this).FlashPlayer({ flashFile: file, autostart: start, width: w, height: h });
    });

    $(".FLVPlayer").each(function() {
        var start = $(this).attr("autostart");
        if (start == "") { start == "no"; }
        var file = $(this).attr("file");
        var w = $(this).attr("width");
        if (w == "") { w = "500"; }
        var h = $(this).attr("height");
        if (h == "") { h = "400"; }
        var img = $(this).attr("loading");
        if (img == "") { img = "/javascript/swf/loading.gif"; }
        $(this).FLVPlayer({ vodFile: file, loading: img, autostart: start, width: w, height: h });
    });

    $(".MP3Player").each(function() {
        var start = $(this).attr("autostart");
        if (start == "") { start == "no"; }
        var file = $(this).attr("file");
        $(this).MP3Player({ soundFile: file, autostart: start });
    });
});