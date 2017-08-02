User.delete_all
account1 = User.create user_id: 1, name: 'test1', password: "test1", email: "test1@example.com"
account2 = User.create user_id: 2, name: 'test2', password: "test2", email: "test2@example.com"
account3 = User.create user_id: 3, name: 'test3', password: "test3", email: "test3@example.com"
