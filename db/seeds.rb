# Minimum required to bootstrap the Refuge : one user+member, one location and a configuration

User.create(
  :email                 => 'admin@refuge.com',
  :password              => '123456',
  :password_confirmation => '123456',
  :role                  => 'admin',
  :view_as_user          => false
)

Location.create

Conf.create(
  :default_avatar_uid => '2012/04/15/13_58_04_30_default_avatar.png'
)

