class Genre < ActiveHash::Base
  self.data = [
    {id: 1, name: 'レディース'}, {id: 2, name: 'メンズ'}, {id: 3, name: 'キッズ'}
  ]
end