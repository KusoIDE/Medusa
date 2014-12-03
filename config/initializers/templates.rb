require 'templates/elisp'

ActionView::Template.register_template_handler(:elisp,
                                               ActionView::Template::Handlers::ELisp.new)
