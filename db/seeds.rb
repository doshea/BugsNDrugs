User.delete_all
BugClass.delete_all

#creates a non-admin User
User.create(
  first_name: 'Test',
  last_name: 'Testerson',
  email: 'test@gmail.com',
  username: 'test_user',
  is_admin: false,
  password: 'qwerty',
  password_confirmation: 'qwerty'
)

#creates an admin User
User.create(
  first_name: 'Chief',
  last_name: 'Chieferson',
  email: 'chief@gmail.com',
  username: 'chief',
  is_admin: true,
  password: 'qwerty',
  password_confirmation: 'qwerty'
)

bugs = BugClass.create(
  name: BugClass.universal_class,
  order: 1,
  superclass_id: nil
)

bacteria = BugClass.create(
  name: 'Bacteria',
  order: 1
)
viruses = BugClass.create(
  name: 'Viruses',
  order: 2
)
fungi = BugClass.create(
  name: 'Fungi',
  order: 3
)
parasites = BugClass.create(
  name: 'Parasites',
  order: 4
)
gram_pos = BugClass.create(
  name: 'Gram Positive',
  order: 1
)
gram_neg = BugClass.create(
  name: 'Gram Negative',
  order: 2
)

bugs.subclasses << [bacteria, viruses, fungi, parasites]
bacteria.subclasses << [gram_pos, gram_neg]
