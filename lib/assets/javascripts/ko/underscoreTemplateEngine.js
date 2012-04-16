// Change underscore templates to use <@ @> instead of <% %> in order to prevent a conflict with erb
_.templateSettings = {
  interpolate: /<\@\=(.+?)\@>/gim,
  evaluate: /<\@(.+?)\@>/gim
};

// Begin integration of Underscore template engine with Knockout
ko.underscoreTemplateEngine = function () {};

ko.underscoreTemplateEngine.prototype = ko.utils.extend(new ko.templateEngine(), {
  renderTemplateSource: function (templateSource, bindingContext, options) {
    // Precompile and cache the templates for efficiency
    var precompiled = templateSource.data('precompiled');
    
    if (!precompiled) {
      precompiled = _.template("<@ with($data) { @> " + templateSource.text() + " <@ } @>");
      templateSource.data('precompiled', precompiled);
    }
    
    // Run the template and parse its output into an array of DOM elements
    var renderedMarkup = precompiled(bindingContext).replace(/\s+/g, " ");
    return ko.utils.parseHtmlFragment(renderedMarkup);
  },
  
  createJavaScriptEvaluatorBlock: function(script) {
    return "<@= " + script + " @>";
  }
});

ko.setTemplateEngine(new ko.underscoreTemplateEngine());