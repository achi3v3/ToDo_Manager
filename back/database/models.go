package database

type User struct {
	ID       int    `json:"id" gorm:"primaryKey;autoIncrement"`
	Email    string `json:"email" gorm:"unique;not null"`
	Password string `json:"password" gorm:"not null"`
}

type Task struct {
	ID          int    `json:"id" gorm:"primaryKey;autoIncrement"`
	Title       string `json:"title" gorm:"not null"`
	Description string `json:"description" gorm:"not null"`
	Status      string `json:"status" gorm:"not null"`
	UserID      int    `json:"user_id" gorm:"not null"`
}
