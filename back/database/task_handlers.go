package database

func Create_Task(task *Task) error {
	db := GetDB()
	result := db.Create(task)
	return result.Error
}
