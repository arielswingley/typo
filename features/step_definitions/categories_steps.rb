# in features/step_definitions/categories_steps.rb

Given /^the following categories exist:$/ do |table|
    table.hashes.each do |category|
        Category.create!("name" => category[:name], 
                        "permalink" => category[:permalink], 
                        "keywords" => category[:keywords],
                        "description" => category[:description])
    end
end

When /^I "(.*?)" the "(.*?)" category$/ do |action, name|
    if action.eql? "Edit"
        link_id = "edit_#{name}"
    else
        link_id = "delete_#{name}"
    end
    click_link(link_id)
end

And /^the (.*?) of the "(.*?)" category should be "(.*?)"$/ do |field, name, value|
    category_entry = Category.where("name" => name, field => value).length
    if category_entry.respond_to? :should
        category_entry.should be(1)
    else
        assert category_entry == 1
    end
end