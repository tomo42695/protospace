# protospace
# データベース設計書
- protos
  - id    integer
  - title   text
  - text   text
  - catchcopy   text
  - concept   text
  - enum image: { main: 0, sub: 1 }
- users
  - id   integer
  - username    string
  - password    string
- comments
  - id   integer
  - users_id   integer
  - protos_id   integer
  - text   text
- tags
  - id   integer
  - name   string
- protos_tags
  - tags_id   integer
  - protos_id   integer
  
アソシエーション
- protos
  - belongs_to :user
  - has_many :comments
  - has_many :tags, through: :protos_tags
  - has_many :images
- users
  - has_many :protos
  - has_many :comments
- images
  - belongs_to :proto
- comments
  - belongs_to :proto
  - belongs_to :user
- tags
  - has_many :protos, through: :protos_tags
- protos_tags
  - belongs_to :proto
  - belongs_to :tag
