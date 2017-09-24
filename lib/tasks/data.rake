namespace :data do
  desc "Sets the default values for users privacy_settings field"
  task privacy_settings: :environment do
    User.all.each do |user|
      if user.privacy_settings.empty?
        user.privacy_settings = {
          "personal"=>{"name"=>true, "email"=>true, "address"=>true, "phone"=>true},
          "social"=>{"facebook"=>true, "twitter"=>true, "instagram"=>true, "linked_id"=>true, "pinterest"=>true, "tumblr"=>true},
          "contact"=>{"solicitation"=>true, "emails"=>true, "phone_calls"=>true, "snail_mail"=>true},
          "camp"=>{"volunteer_info"=>true, "donor_info"=>true, "alumni_info"=>true, "counselor_info"=>true, "hospital_outreach_info"=>true}
        }
      end

      keys = ["personal", "social", "contact", "camp"]

      keys.each do |key|
        user.privacy_settings[key] ||= {}
      end

      user.save
    end
  end
end
