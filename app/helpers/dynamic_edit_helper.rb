# app/helpers/dynamic_edit_helper.rb
module DynamicEditHelper

  def editable_p(obj, attribute, condition, fallback_text='EMPTY')
    capture_haml do
      haml_tag :p, class: "#{'admin-editable' if condition}", data: {param: attribute} do
        haml_concat obj.send(attribute) || (fallback_text if condition)
      end
    end
  end

  def editable_img(obj, attribute, condition, fallback_text='EMPTY')
    capture_haml do
      if obj.send(attribute).file
        haml_tag :img, src: obj.send(attribute).url, class: "#{'admin-editable' if condition}"
      else
        attribute = "remote_#{attribute.to_s}_url".to_sym
        haml_tag :p, class: "#{'admin-editable' if condition}", data: {param: attribute} do
          haml_concat fallback_text if condition
        end
      end
    end
  end

end