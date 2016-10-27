def user_attr_confirmation_fix(user_attributes)
  pass_confirmation = user_attributes[:password_confirmation]
  user_attributes.merge(confirmation: pass_confirmation).except(:password_confirmation)
end