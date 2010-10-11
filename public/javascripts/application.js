LT = {
    initialized: false,
    input_initialized: false,
    
    init: function() {
        this.initialized = true;
        this.browserTweaks();
    },
    
    initLogoNew: function() {
        var self = this;

        var init = function(e) {
            if(!self.input_initialized) {
                $('.click_to_edit').removeClass('click_to_edit_active');
                self.input_initialized = true;
                $('.logo_container input').focus();
                $('.explain').hide();
                $('.save').fadeIn();
            }
        };

        $('.logo_container input').click(init);
        
        $('.click_to_edit').click(init);
        
        $('.click_to_edit').mouseenter(function() {
            $(this).addClass('click_to_edit_active');
        });
        
        $('.click_to_edit').mouseleave(function() {
            $(this).removeClass('click_to_edit_active');
        });
                
        $('.save').click(function(e) {
            $(this).closest('form').submit();
        });
    },
    
    centerMyspace: function(e) {
        $('.myspace_logo').each(function(i,e) {
            var outer = $(e).width();
            var inner = $(e).find('span').width() + 200;
            $(e).css('right', Math.round((outer - inner) / 2) + 'px');
        });
    },
    
    browserTweaks: function() {
        jQuery.each(jQuery.browser, function(i, val) {
           if(i=="mozilla") {
               $('.gap_container').css('background-position', '662px 3px');
               $('.gap_logo .text').css('background-position', 'right 3px');
           }
        });
    } 
};

$(function() {
    LT.init();
});