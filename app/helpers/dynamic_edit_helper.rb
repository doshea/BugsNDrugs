# app/helpers/dynamic_edit_helper.rb
module DynamicEditHelper

  def editable_p(obj, attribute, edit_condition, fallback_text='EMPTY')
    sendable = obj.send(attribute)
    if edit_condition || sendable
      capture_haml do
        haml_tag :hr, class: "#{'hidden-to-users' unless sendable}"
        haml_tag :h6, class: "#{'hidden-to-users' unless sendable}" do
          haml_concat attribute.to_s.titleize
        end
        if sendable
          haml_concat obj.send(attribute)
        else
          haml_tag :p, class: 'admin-editable hidden-to-users', data: {param: attribute} do
            haml_concat obj.send(attribute) || (fallback_text if edit_condition)
          end
        end
      end
    end
  end

  def editable_img(obj, attribute, edit_condition, fallback_text='EMPTY')
    sendable = obj.send(attribute).file
    if edit_condition || sendable
      capture_haml do
        haml_tag :hr, class: "#{'hidden-to-users' if edit_condition}"
        if sendable
          haml_tag :img, src: obj.send(attribute).url, class: "#{'admin-editable' if edit_condition}"
        else
          haml_tag :h6, class: 'hidden-to-users' do
            haml_concat attribute.to_s.titleize
          end
          attribute = "remote_#{attribute.to_s}_url".to_sym
          haml_tag :p, class: 'admin-editable hidden-to-users', data: {param: attribute} do
            haml_concat fallback_text if edit_condition
          end
        end
      end
    end
  end

  def editable_array(obj, attribute, edit_condition, fallback_text='EMPTY')
    capture_haml do
      haml_tag :hr
      haml_tag :h6 do
        haml_concat attribute.to_s.titleize
      end
      haml_tag :div, class: "#{'admin-editable-array' if edit_condition}", data: {param: attribute} do 
        haml_tag :ul do
          obj.send(attribute).each do |el|
            haml_tag :li do
              haml_concat el
            end
          end
        end
        if edit_condition
          haml_tag :input, type: 'text', placeholder: 'Add your own', class: 'hidden-to-users'
        end
      end
    end
  end

end