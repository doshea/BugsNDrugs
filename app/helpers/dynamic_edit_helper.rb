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

  def editable_array(obj, attribute, condition, fallback_text='EMPTY')
    capture_haml do
      haml_tag :div, class: "#{'admin-editable-array' if condition}", data: {param: attribute} do 
        haml_tag :ul do
          obj.send(attribute).each do |el|
            haml_tag :li do
              haml_concat el
            end
          end
        end
        if condition
          haml_tag :input, type: 'text', placeholder: 'Add your own'
        end
      end
    end
  end

end