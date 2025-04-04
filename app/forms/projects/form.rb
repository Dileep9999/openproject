# frozen_string_literal: true

#-- copyright
# OpenProject is an open source project management software.
# Copyright (C) the OpenProject GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2013 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See COPYRIGHT and LICENSE files for more details.
#++
module Projects
  class Form < ApplicationForm
    include ::CustomFields::CustomFieldRendering

    form do |f|

      f.html_content do
        # "<h4>test</h4>".html_safe
      end

      f.group(layout: :horizontal) do |template_group|
       # template_group.text_field name: :template, label: "template", value: "foo"

        template_group.project_autocompleter(
         scope_name_to_model: false,
         name: "template",
         value: "foo",
         label: "Template",
         autocomplete_options: {
           dropdownPosition: "bottom",
           decorated: true,
           inputName: "FOOBAR",
           #inputValue: "FOOBAR2_value",
           labelForId: "FOOBAR2",
           filters: [
             { name: "user_action", operator: "=", values: ["projects/copy"] },
             { name: "templated", operator: "=", values: ["t"] }
           ],
           data: {
            "projects-form-target": "templateSelect"
           }
         }
        )
      end

      f.text_field name: :name, label: attribute_name(:name), required: true

      f.project_autocompleter(
        name: :parent_id,
        label: attribute_name(:parent_id),
        autocomplete_options: {
          dropdownPosition: "bottom",
          # filters: [{ name: "user_action", operator: "=", values: ["meetings/create"] }]
        }
      )
    end
  end
end
