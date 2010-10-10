LT = {
    initialized: false,
    input_initialized: false,
    
    init: function() {
        this.gap_text = $('input.gap');
        this.attachEvents();
        this.initialized = true;
        
        this.browserTweaks();
        this.tshirt();
    },
    
    attachEvents: function() {
        var self = this;

        var init = function(e) {
            if(!self.input_initialized) {
                $('.click_to_edit').removeClass('click_to_edit_active');
                self.input_initialized = true;
                $('.gap').focus();
                $('.explain').hide();
                $('.save').fadeIn();
            }
        };

        this.gap_text.click(init);
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
    
    browserTweaks: function() {
        jQuery.each(jQuery.browser, function(i, val) {
           if(i=="mozilla") {
               $('.gap_container').css('background-position', '662px 3px');
               $('.logo .text').css('background-position', 'right 3px');
           }
            
        });
    } 
};

$(function() {
    LT.init();
});