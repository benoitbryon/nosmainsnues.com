import jQuery from 'jquery'
import bootstrap from 'bootstrap'


(function($) {
  $(document).ready(function() {
    $('[data-toggle="tooltip"]').tooltip();
    $('[data-toggle="popover"]').popover();

    if($("body.article")) {
      wrapImagesInsideHyperlinks($(".figure > img"));
    }
  });


  /** Wrap each IMG elements (passed as jQuery elements) into A element
   *  which links to image's SRC attribute.
   **/
  function wrapImagesInsideHyperlinks(items) {
    items.each(function(index) {
      $(this).wrap("<a href='" + $(this).attr("src") + "'></a>");
    });
  }
})(jQuery);
