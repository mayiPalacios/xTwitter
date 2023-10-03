json.array!(@tweets) do |tweet|
    json.extract! tweet, :id, :body, :quote, :retweet, :created_at, :updated_at, :user_id, :interaction_reference
end