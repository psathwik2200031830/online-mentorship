package com.Entity;

public class Specialization {
        private int id;
        private String teacherspecialization;
        
		public Specialization() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Specialization(int id, String teacherspecialization) {
			super();
			this.id = id;
			this.teacherspecialization = teacherspecialization;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getTeacherspecialization() {
			return teacherspecialization;
		}
		public void setTeacherspecialization(String teacherspecialization) {
			this.teacherspecialization = teacherspecialization;
		}
	
	   
}
