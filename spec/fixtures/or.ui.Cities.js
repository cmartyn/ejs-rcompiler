// Autogenerated from an Ejs file. Edits may be lost.


window.or = window.or || {};
window.or.ui = window.or.ui || {};
window.or.ui.Cities = window.or.ui.Cities || {};
or.ui.Cities.template = function(options) {
  var p = [];
  with(options) {
    p.push('<ul>\n  ');
    /* Loop through each city */
    p.push('\n  ');
    $.each(cities, function() {
    p.push('\n  <li>');
    p.push(this.name);
    p.push('</li>\n  ');
    })
    p.push('\n</ul>\n');
  }
  return p.join('');
}