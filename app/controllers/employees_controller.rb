class EmployeesController < ApplicationController

	def  index
		@employees = Employee.all
	end

	def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(params.require(:employee).permit(:name, :age))

		if @employee.save
			redirect_to employees_path
		else
			render :new
		end
	end

	def edit
		@employee = Employee.find(params[:id])
	end

	def update
		@employee = Employee.find(params[:id])

		@employee.update_attributes!(name: params[:employee][:name], age: params[:employee][:age])

		if @employee.save
			redirect_to employees_path
		else
			redirect_to edit_employee_path(@employee.id)
		end
	end

	def destroy
		@employee = Employee.find(params[:id])

		if @employee.destroy
			redirect_to employees_path
		else
			redirect_to employees_path
		end
	end

end
