package database

func Create_Task(task *Task) error {
	db := GetDB()
	result := db.Create(task)
	return result.Error
}

func Get_All_Tasks() ([]Task, error) {
	db := GetDB()
	var tasks []Task
	result := db.Find(&tasks)
	return tasks, result.Error
}

func Get_Tasks_By_ID(UserID string) ([]Task, error) {
	db := GetDB()
	var tasks []Task
	result := db.Where("user_id = ?", UserID).Find(&tasks)
	return tasks, result.Error
}

func Delete_Task(task *Task) error {
	db := GetDB()
	result := db.Delete(task)
	return result.Error
}
