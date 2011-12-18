App.TemplateProvider =
  applyTemplate: (object_type, template_name, object) ->
    window.HAML.templates[object_type][template_name](object.attributes)

