RSpec::Matchers.define :match_response_schema do |schema_name|
    match do |response|
      schema_directory = "#{Dir.pwd}/spec/support/api/schemas"
      schema_path = "#{schema_directory}/#{schema_name}.json"
      JSON::Validator.validate!(schema_path, response.body, strict: true)
    end
  end
  