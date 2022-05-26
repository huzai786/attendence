from django.db import models



class AdminUsers(models.Model):
    user_name = models.CharField(max_length=100, unique=True)
    pwd = models.CharField(max_length=100)
    full_name = models.CharField(max_length=100, blank=True, null=True)
    comp_name = models.CharField(max_length=100, blank=True, null=True)
    email = models.CharField(max_length=100, blank=True, null=True)
    phone = models.CharField(max_length=20)
    status = models.CharField(max_length=7)
    date_created = models.DateTimeField()
    last_modified = models.DateTimeField(blank=True, null=True)
    last_login = models.DateTimeField(blank=True, null=True)
    ip = models.CharField(max_length=25, blank=True, null=True)
    user_agent = models.TextField(blank=True, null=True)
    permissions = models.TextField()
    user_role_id = models.IntegerField()
    activation_key = models.CharField(max_length=255)
    is_deleted = models.CharField(max_length=1)
    facility_manager = models.CharField(max_length=120)
    facility_id = models.IntegerField()
    salary = models.IntegerField()


    class Meta:
        managed = True
        db_table = 'admin_users'


class TempEmployees(models.Model):
    te_id = models.AutoField(primary_key=True)
    te_first_name = models.CharField(max_length=255)
    te_last_name = models.CharField(max_length=255)
    te_cnic = models.CharField(max_length=15)
    te_attandance = models.CharField(max_length=10)
    te_check_in = models.DateTimeField()
    te_check_out = models.DateTimeField(blank=True, null=True)
    te_facility_id = models.IntegerField()
    te_supervisor_id = models.IntegerField()
    te_designation = models.CharField(max_length=256, blank=True, null=True)
    te_shift = models.CharField(max_length=256, blank=True, null=True)
    te_shift_timing = models.CharField(max_length=256, blank=True, null=True)
    te_phone = models.CharField(max_length=20)
    te_email = models.CharField(max_length=255)
    te_address = models.CharField(max_length=500)
    te_image = models.TextField(blank=True, null=True)
    te_salary = models.CharField(max_length=255)
    te_created_at = models.DateTimeField()
    te_status = models.IntegerField()
    te_is_deleted = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'temp_employees'

class UserRole(models.Model):
    page_id = models.AutoField(primary_key=True)
    role_title = models.CharField(max_length=150)
    permission = models.TextField()
    page_status = models.CharField(max_length=3)
    created_by = models.IntegerField()
    modified_by = models.IntegerField()
    date_created = models.DateTimeField()
    date_updated = models.DateTimeField()
    is_deleted = models.CharField(max_length=1)
    facility_id = models.IntegerField()
    department_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'user_role'

    def __str__(self):
        return str(self.facility_id)


class Facility(models.Model):
    facility_id = models.AutoField(primary_key=True)
    facility_client_id = models.IntegerField()
    facility_zone_id = models.IntegerField(blank=True, null=True)
    facility_supervisor_id = models.IntegerField(blank=True, null=True)
    facility_name = models.CharField(max_length=150)
    facility_manager = models.CharField(max_length=150)
    facility_manager_whatsapp = models.CharField(max_length=20, blank=True, null=True)
    facility_manager_email = models.CharField(max_length=500)
    facility_bom = models.CharField(max_length=150)
    facility_bom_whatsapp = models.CharField(max_length=20)
    facility_bom_email = models.CharField(max_length=500)
    facility_address = models.TextField()
    facility_address2 = models.TextField()
    facility_city = models.CharField(max_length=120)
    facility_state = models.CharField(max_length=120)
    facility_country = models.CharField(max_length=120)
    facility_zipcode = models.CharField(max_length=10)
    facility_contract_date = models.DateField(blank=True, null=True)
    facility_contract_ended = models.DateField()
    facility_phone1 = models.CharField(max_length=20)
    facility_phone2 = models.CharField(max_length=20)
    facility_email1 = models.CharField(max_length=120)
    facility_email2 = models.CharField(max_length=120)
    facility_mobile1 = models.CharField(max_length=20)
    facility_mobile2 = models.CharField(max_length=20)
    facility_refered_by = models.CharField(max_length=150)
    facility_referred_by_cnic = models.CharField(max_length=512, blank=True, null=True)
    facility_referred_by_mobile = models.CharField(max_length=512, blank=True, null=True)
    facility_referred_by_email = models.CharField(max_length=512, blank=True, null=True)
    facility_referred_by_phone = models.CharField(max_length=512, blank=True, null=True)
    facility_referred_by_home_address = models.CharField(max_length=512, blank=True, null=True)
    facility_referred_by_office_address = models.CharField(max_length=512, blank=True, null=True)
    facility_added = models.DateTimeField()
    facility_added_by = models.IntegerField()
    facility_updated = models.DateTimeField()
    facility_updated_by = models.IntegerField()
    facility_deleted = models.CharField(max_length=1)
    facility_status = models.CharField(max_length=10)

    class Meta:
        managed = False
        db_table = 'facility'

    def __str__(self):
        return str(self.facility_name)


class Employee(models.Model):
    emp_id = models.AutoField(primary_key=True)
    title_id = models.IntegerField()
    emp_first_name = models.CharField(max_length=100)
    emp_last_name = models.CharField(max_length=100, blank=True, null=True)
    emp_police_verification = models.CharField(max_length=100)
    emp_cnic = models.CharField(max_length=15)
    emp_passport_no = models.CharField(max_length=11)
    emp_religion = models.CharField(max_length=50)
    emp_dob = models.DateTimeField()
    emp_doj = models.DateTimeField()
    emp_dot = models.DateTimeField(blank=True, null=True)
    emp_termination_reason = models.CharField(max_length=512, blank=True, null=True)
    emp_reffered_by = models.CharField(max_length=50)
    emp_reffered_by_cnic = models.CharField(max_length=512, blank=True, null=True)
    emp_reffered_by_mobile = models.CharField(max_length=512, blank=True, null=True)
    emp_reffered_by_phone = models.CharField(max_length=512, blank=True, null=True)
    emp_reffered_by_email = models.CharField(max_length=512, blank=True, null=True)
    emp_reffered_by_home_address = models.CharField(max_length=512, blank=True, null=True)
    emp_reffered_by_office_address = models.CharField(max_length=512, blank=True, null=True)
    emp_reffered_by_2 = models.CharField(max_length=50)
    emp_reffered_by_2_cnic = models.CharField(max_length=512, blank=True, null=True)
    emp_reffered_by_2_mobile = models.CharField(max_length=512, blank=True, null=True)
    emp_reffered_by_2_phone = models.CharField(max_length=512, blank=True, null=True)
    emp_reffered_by_2_email = models.CharField(max_length=512, blank=True, null=True)
    emp_reffered_by_2_home_address = models.CharField(max_length=512, blank=True, null=True)
    emp_reffered_by_2_office_address = models.CharField(max_length=512, blank=True, null=True)
    emp_eobi_no = models.IntegerField()
    emp_marital_status = models.CharField(max_length=100)
    emp_no = models.IntegerField()
    emp_gender = models.CharField(max_length=50)
    emp_blood_group = models.CharField(max_length=50)
    emp_phone = models.CharField(max_length=50)
    emp_phone_2 = models.CharField(max_length=50)
    emp_email = models.CharField(max_length=100)
    emp_email_2 = models.CharField(max_length=100)
    emp_mobile = models.CharField(max_length=50)
    emp_mobile_2 = models.CharField(max_length=50)
    emp_age = models.IntegerField()
    emp_status = models.CharField(max_length=50, blank=True, null=True)
    emp_department_id = models.IntegerField()
    emp_designation_id = models.IntegerField()
    emp_created_on = models.DateTimeField()
    emp_created_by = models.CharField(max_length=50)
    emp_modified_on = models.DateTimeField()
    emp_modified_by = models.CharField(max_length=50)
    emp_is_active = models.IntegerField()
    emp_is_delete = models.IntegerField()
    emp_picture = models.TextField(blank=True, null=True)
    emp_id_mark = models.CharField(max_length=15)
    emp_gratuity_fun = models.CharField(max_length=15)
    emp_provident_fund = models.CharField(max_length=15)
    emp_facility_id = models.IntegerField()
    emp_monthly_article_deduction = models.IntegerField()
    emp_account_title = models.CharField(max_length=120)
    emp_bank_branch_name = models.CharField(max_length=30, blank=True, null=True)
    emp_bank_branch_code = models.CharField(max_length=30, blank=True, null=True)
    emp_account_number = models.CharField(max_length=30)
    emp_user_id = models.IntegerField()
    emp_encoding = models.BinaryField(blank=True, null=True, max_length=10000)

    class Meta:
        managed = False
        db_table = 'employee'

    def __str__(self):
        return str(self.emp_first_name + self.emp_last_name)

class EmployeeFacility(models.Model):
    ef_id = models.AutoField(primary_key=True)
    emp_id = models.IntegerField(blank=True, null=True)
    facility_id = models.IntegerField(blank=True, null=True)
    deployment_date = models.DateTimeField(blank=True, null=True)
    evacuation_date = models.DateTimeField(blank=True, null=True)
    deployed_by = models.IntegerField(blank=True, null=True)
    evacuated_by = models.IntegerField(blank=True, null=True)
    is_deleted = models.IntegerField(blank=True, null=True)
    status = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'employee_facility'

    def __str__(self):
        return str(self.emp_id + 'and' +self.facility_id)


class EmployeeAttendance(models.Model):
    ea_id = models.AutoField(primary_key=True)
    ea_facility_id = models.IntegerField()
    ea_employee_id = models.IntegerField()
    ea_checkin = models.TimeField()
    ea_checkout = models.TimeField()
    ea_attendance = models.CharField(max_length=1)
    ea_is_late = models.IntegerField()
    ea_absent_reason = models.TextField()
    ea_date = models.DateField()
    ea_added = models.DateTimeField()
    ea_updated = models.DateTimeField(auto_now=True)
    ea_created_by = models.IntegerField(null=True, blank=True)
    ea_updated_by = models.IntegerField(null=True, blank=True)
    ea_is_deleted = models.CharField(max_length=1,null=True, blank=True)
    ea_status = models.CharField(max_length=15, null=True, blank=True)
    ea_marked_type = models.CharField(max_length=4, null=True, blank=True)

    class Meta:
        managed = False
        db_table = 'employee_attendance'

    def __str__(self):
        return str(self.ea_added)


class Accounts(models.Model):
    a_id = models.AutoField(primary_key=True)
    a_facility_id = models.IntegerField()
    a_name = models.CharField(max_length=150)
    a_description = models.TextField()
    a_added = models.DateTimeField()
    a_updated = models.DateTimeField()
    a_created_by = models.IntegerField()
    a_updated_by = models.IntegerField()
    a_is_deleted = models.CharField(max_length=1)
    a_status = models.CharField(max_length=15)

    class Meta:
        managed = False
        db_table = 'accounts'

    def __str__(self):
        return str(self.a_name)





class EmployeeEmergencyContact(models.Model):
    eec_id = models.AutoField(primary_key=True)
    eec_name = models.CharField(max_length=80)
    eec_relation_id = models.IntegerField()
    eec_cnic = models.CharField(max_length=18)
    eec_passport_no = models.CharField(max_length=30)
    eec_phone1 = models.CharField(max_length=20)
    eec_phone2 = models.CharField(max_length=20)
    eec_email1 = models.CharField(max_length=120)
    eec_email2 = models.CharField(max_length=120)
    eec_mobile1 = models.CharField(max_length=20)
    eec_mobile2 = models.CharField(max_length=20)
    eec_modified_on = models.DateTimeField()
    eec_modified_by = models.IntegerField()
    eec_status = models.CharField(max_length=15)
    eec_permanent_address = models.TextField()
    eec_temporary_address = models.TextField()
    eec_permanent_address2 = models.TextField()
    eec_temporary_address2 = models.TextField()
    eec_city1 = models.CharField(max_length=40)
    eec_city2 = models.CharField(max_length=40)
    eec_state1 = models.CharField(max_length=10)
    eec_state2 = models.CharField(max_length=10)
    eec_zipcode1 = models.CharField(max_length=15)
    eec_zipcode2 = models.CharField(max_length=15)
    eec_employee_id = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'employee_emergency_contact'

class Article(models.Model):
    a_id = models.AutoField(primary_key=True)
    a_name = models.CharField(max_length=50)
    a_price = models.CharField(max_length=8)
    a_deduction_type = models.CharField(max_length=6)
    a_deduction_rate = models.CharField(max_length=10)
    a_created_on = models.DateTimeField()
    a_created_by = models.IntegerField()
    a_modified_on = models.DateTimeField()
    a_modified_by = models.IntegerField()
    a_status = models.CharField(max_length=15)
    a_is_deleted = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = 'article'


class CiSessions(models.Model):
    session_id = models.CharField(primary_key=True, max_length=40)
    ip_address = models.CharField(max_length=45)
    user_agent = models.CharField(max_length=120)
    last_activity = models.PositiveIntegerField()
    user_data = models.TextField()

    class Meta:
        managed = False
        db_table = 'ci_sessions'


class Client(models.Model):
    client_id = models.AutoField(primary_key=True)
    client_name = models.CharField(max_length=120)
    client_logo = models.TextField()
    client_address1 = models.TextField()
    client_address2 = models.TextField()
    client_city = models.CharField(max_length=60)
    client_state = models.CharField(max_length=60)
    client_country = models.CharField(max_length=80)
    client_zipcode = models.CharField(max_length=9)
    client_contract_date = models.DateTimeField()
    client_contract_end_date = models.DateTimeField()
    client_referred_by = models.CharField(max_length=80)
    client_referred_by_cnic = models.CharField(max_length=512, blank=True, null=True)
    client_referred_by_phone = models.CharField(max_length=512, blank=True, null=True)
    client_referred_by_mobile = models.CharField(max_length=512, blank=True, null=True)
    client_referred_by_email = models.CharField(max_length=512, blank=True, null=True)
    client_referred_by_home_address = models.CharField(max_length=512, blank=True, null=True)
    client_referred_by_office_address = models.CharField(max_length=512, blank=True, null=True)
    client_status = models.CharField(max_length=15)
    client_added = models.DateTimeField()
    client_created_by = models.IntegerField()
    client_updated = models.DateTimeField()
    client_updated_by = models.IntegerField()
    client_is_deleted = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = 'client'


class Department(models.Model):
    d_id = models.AutoField(primary_key=True)
    d_name = models.CharField(max_length=40)
    d_created_on = models.DateTimeField()
    d_created_by = models.IntegerField()
    d_modified_on = models.DateTimeField()
    d_modified_by = models.IntegerField()
    d_status = models.CharField(max_length=15)
    d_is_deleted = models.CharField(max_length=1)
    parent_id = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'department'


class DocumentType(models.Model):
    dt_id = models.AutoField(primary_key=True)
    dt_name = models.CharField(max_length=30)
    dt_created_on = models.DateTimeField()
    dt_created_by = models.IntegerField()
    dt_modified_on = models.DateTimeField()
    dt_modified_by = models.IntegerField()
    dt_status = models.CharField(max_length=15)
    dt_is_deleted = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = 'document_type'




class EmployeeAddress(models.Model):
    ea_id = models.AutoField(primary_key=True)
    ea_emp_id = models.IntegerField()
    ea_type = models.IntegerField()
    ea_city = models.CharField(max_length=40)
    ea_state = models.CharField(max_length=10)
    ea_zipcode = models.CharField(max_length=15)
    ea_address1 = models.TextField()
    ea_address2 = models.TextField()
    ea_is_deleted = models.CharField(max_length=1)
    ea_modified_on = models.DateTimeField()
    ea_modified_by = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'employee_address'


class EmployeeArticle(models.Model):
    ea_id = models.AutoField(primary_key=True)
    ea_employee_id = models.IntegerField()
    ea_return_status = models.CharField(max_length=100, blank=True, null=True)
    ea_article_id = models.IntegerField()
    ea_price = models.IntegerField()
    ea_deduction_type = models.CharField(max_length=15)
    ea_deduction_rate = models.CharField(max_length=9)
    ea_created_on = models.DateTimeField()
    ea_created_by = models.IntegerField()
    ea_is_deleted = models.CharField(max_length=1)
    ea_modified_on = models.DateTimeField()
    ea_modified_by = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'employee_article'


class EmployeeArticleRemaining(models.Model):
    ear_id = models.AutoField(primary_key=True)
    ear_employee_article_id = models.IntegerField()
    ear_month = models.IntegerField()
    ear_deduction_amount = models.IntegerField()
    ear_created_on = models.DateTimeField()
    ear_created_by = models.IntegerField()
    ear_modified_on = models.DateTimeField()
    ear_modified_by = models.IntegerField()
    ear_status = models.CharField(max_length=15)
    ear_is_deleted = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = 'employee_article_remaining'




class EmployeeDocument(models.Model):
    ed_id = models.AutoField(primary_key=True)
    ed_employee_id = models.IntegerField()
    ed_name = models.CharField(max_length=40)
    ed_url = models.TextField()
    ed_type_id = models.IntegerField()
    ed_expired_on = models.DateField(blank=True, null=True)
    ed_created_on = models.DateTimeField()
    ed_created_by = models.IntegerField()
    ed_modified_on = models.DateTimeField()
    ed_modified_by = models.IntegerField()
    ed_status = models.CharField(max_length=15)
    ed_is_deleted = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = 'employee_document'




class EmployeePayroll(models.Model):
    ep_id = models.AutoField(primary_key=True)
    ep_employee_id = models.IntegerField()
    ep_total_salary = models.IntegerField()
    ep_net_salary = models.IntegerField()
    ep_deduction = models.IntegerField()
    ep_commission = models.IntegerField()
    ep_month = models.DateField()
    ep_added = models.DateTimeField()
    ep_updated = models.DateTimeField()
    ep_created_by = models.IntegerField()
    ep_updated_by = models.IntegerField()
    ep_is_deleted = models.CharField(max_length=1)
    ep_status = models.CharField(max_length=15)
    ep_year = models.IntegerField()
    ep_provident_fund = models.IntegerField()
    ep_gratuity_fund = models.IntegerField()
    ep_bonus = models.IntegerField()
    ep_eobi_deduction = models.IntegerField()
    ep_overtime = models.IntegerField(blank=True, null=True)
    ep_gross_salary = models.IntegerField()
    ep_daily_overtime = models.IntegerField()
    ep_cash_advance = models.IntegerField()
    ep_medical_insurance = models.IntegerField()
    ep_life_insurance = models.IntegerField()
    ep_transit_insurance = models.IntegerField()
    ep_monthly_uniform_deduction = models.IntegerField()
    ep_sesi = models.IntegerField()
    ep_amount_withheld = models.IntegerField()
    ep_amount_released = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'employee_payroll'


class EmployeeSalary(models.Model):
    es_id = models.AutoField(primary_key=True)
    es_employee_id = models.IntegerField()
    es_salary = models.IntegerField()
    es_created_on = models.DateTimeField()
    es_created_by = models.IntegerField()
    es_is_deleted = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = 'employee_salary'


class EmployeeSupervisor(models.Model):
    es_id = models.AutoField(primary_key=True)
    employee_id = models.IntegerField(blank=True, null=True)
    supervisor_id = models.IntegerField(blank=True, null=True)
    created_on = models.DateTimeField(blank=True, null=True)
    created_by = models.IntegerField(blank=True, null=True)
    is_deleted = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'employee_supervisor'


class Expenses(models.Model):
    e_id = models.AutoField(primary_key=True)
    e_facility_id = models.IntegerField()
    e_account_id = models.IntegerField()
    e_description = models.TextField()
    e_amount = models.FloatField()
    e_added = models.DateTimeField()
    e_updated = models.DateTimeField()
    e_created_by = models.IntegerField()
    e_updated_by = models.IntegerField()
    e_is_deleted = models.CharField(max_length=1)
    e_status = models.CharField(max_length=15)
    e_date = models.DateField()

    class Meta:
        managed = False
        db_table = 'expenses'




class GazettedHolidays(models.Model):
    gh_id = models.AutoField(primary_key=True)
    gh_date = models.DateField()
    gh_description = models.TextField()
    gh_created_on = models.DateTimeField()
    gh_created_by = models.IntegerField()
    gh_modified_on = models.DateTimeField()
    gh_modified_by = models.IntegerField()
    gh_status = models.CharField(max_length=15)
    gh_is_deleted = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = 'gazetted_holidays'


class Items(models.Model):
    i_id = models.AutoField(primary_key=True)
    i_facility_id = models.IntegerField()
    i_name = models.CharField(max_length=160)
    i_description = models.TextField()
    i_unit_price = models.FloatField()
    i_added = models.DateTimeField()
    i_updated = models.DateTimeField()
    i_created_by = models.IntegerField()
    i_updated_by = models.IntegerField()
    i_is_deleted = models.CharField(max_length=1)
    i_status = models.CharField(max_length=15)

    class Meta:
        managed = False
        db_table = 'items'


class PurchaseDetails(models.Model):
    pd_id = models.AutoField(primary_key=True)
    pd_facility_id = models.IntegerField()
    pd_purchase_id = models.IntegerField()
    pd_item_id = models.IntegerField()
    pd_qty = models.IntegerField()
    pd_unit_price = models.FloatField()
    pd_added = models.DateTimeField()
    pd_updated = models.DateTimeField()
    pd_created_by = models.IntegerField()
    pd_updated_by = models.IntegerField()
    pd_is_deleted = models.CharField(max_length=1)
    pd_status = models.CharField(max_length=15)
    pd_discount_percent = models.IntegerField()
    pd_discount_rs = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'purchase_details'


class Purchases(models.Model):
    p_id = models.AutoField(primary_key=True)
    p_facility_id = models.IntegerField()
    p_account_id = models.IntegerField()
    p_supplier_id = models.IntegerField()
    p_total = models.FloatField()
    p_remaining = models.FloatField()
    p_paid = models.FloatField()
    p_added = models.DateTimeField()
    p_updated = models.DateTimeField()
    p_created_by = models.IntegerField()
    p_updated_by = models.IntegerField()
    p_is_deleted = models.CharField(max_length=1)
    p_status = models.CharField(max_length=15)
    p_remarks = models.CharField(max_length=255)
    p_date = models.DateField()
    p_payable = models.IntegerField()
    p_total_discount_percent = models.IntegerField()
    p_total_discount_rs = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'purchases'


class Relation(models.Model):
    r_id = models.AutoField(primary_key=True)
    r_name = models.CharField(max_length=50)
    r_status = models.CharField(max_length=15)
    r_is_deleted = models.CharField(max_length=1)
    r_created_on = models.DateTimeField()
    r_created_by = models.IntegerField()
    r_modified_on = models.DateTimeField()
    r_modified_by = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'relation'


class Relations(models.Model):
    relative_id = models.AutoField(primary_key=True)
    relative_name = models.CharField(max_length=50)
    relative_created_by = models.IntegerField()
    relative_created = models.DateTimeField()
    relative_updated_by = models.IntegerField()
    relative_updated = models.DateTimeField()
    relative_status = models.CharField(max_length=8)
    relative_is_deleted = models.CharField(max_length=1)
    relative_facility_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'relations'


class Religion(models.Model):
    religion_id = models.AutoField(primary_key=True)
    religion_name = models.CharField(max_length=50, blank=True, null=True)
    religion_created_on = models.DateTimeField(blank=True, null=True)
    religion_created_by = models.IntegerField(blank=True, null=True)
    religion_modified_on = models.DateTimeField(blank=True, null=True)
    religion_modified_by = models.IntegerField(blank=True, null=True)
    religion_is_active = models.IntegerField(blank=True, null=True)
    religion_is_delete = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'religion'


class Reminders(models.Model):
    r_id = models.AutoField(primary_key=True)
    r_facility_id = models.IntegerField()
    r_added = models.DateTimeField()
    r_updated = models.DateTimeField()
    r_created_by = models.IntegerField()
    r_updated_by = models.IntegerField()
    r_is_deleted = models.CharField(max_length=1)
    r_status = models.CharField(max_length=10)
    r_remind_on = models.DateTimeField()
    r_type = models.CharField(max_length=16)
    r_completed = models.CharField(max_length=1)
    r_text = models.TextField()
    r_recurring = models.CharField(max_length=1)
    r_report_to = models.IntegerField()
    r_priority = models.CharField(max_length=10)
    r_lock_after = models.DateField()
    r_assigned_to = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'reminders'


class ReportType(models.Model):
    r_id = models.AutoField(primary_key=True)
    r_name = models.CharField(max_length=120)
    r_status = models.CharField(max_length=15)
    r_created_by = models.IntegerField()
    r_updated_by = models.IntegerField()
    r_added = models.DateTimeField()
    r_updated = models.DateTimeField()
    r_is_deleted = models.CharField(max_length=1)
    r_facility_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'report_type'


class SiteSettings(models.Model):
    website_title = models.CharField(max_length=255, blank=True, null=True)
    logo = models.CharField(max_length=255, blank=True, null=True)
    website_url = models.CharField(max_length=255, blank=True, null=True)
    facility_id = models.IntegerField()
    tag_line = models.CharField(max_length=80)
    address = models.CharField(max_length=75)
    full_address = models.CharField(max_length=130, db_collation='utf8_bin')
    tel = models.CharField(max_length=15)
    last_attandance_time = models.TimeField()
    late_attandance_time = models.TimeField()

    class Meta:
        managed = False
        db_table = 'site_settings'


class StockRelease(models.Model):
    sr_id = models.AutoField(primary_key=True)
    sr_facility_id = models.IntegerField()
    sr_item_id = models.IntegerField()
    sr_qty = models.IntegerField()
    sr_issued_to = models.IntegerField()
    sr_description = models.TextField()
    sr_added = models.DateTimeField()
    sr_updated = models.DateTimeField()
    sr_created_by = models.IntegerField()
    sr_updated_by = models.IntegerField()
    sr_is_deleted = models.CharField(max_length=1)
    sr_status = models.CharField(max_length=15)

    class Meta:
        managed = False
        db_table = 'stock_release'


class Stocks(models.Model):
    s_id = models.AutoField(primary_key=True)
    s_facility_id = models.IntegerField()
    s_item_id = models.IntegerField()
    s_qty = models.IntegerField()
    s_min_qty = models.IntegerField()
    s_added = models.DateTimeField()
    s_updated = models.DateTimeField()
    s_created_by = models.IntegerField()
    s_updated_by = models.IntegerField()
    s_is_deleted = models.CharField(max_length=1)
    s_status = models.CharField(max_length=15)

    class Meta:
        managed = False
        db_table = 'stocks'


class SubsPlan(models.Model):
    subs_plan_id = models.AutoField(primary_key=True)
    subs_plan_name = models.CharField(max_length=25)
    subs_plan_price = models.CharField(max_length=15)

    class Meta:
        managed = False
        db_table = 'subs_plan'


class Suppliers(models.Model):
    s_id = models.AutoField(primary_key=True)
    s_name = models.CharField(max_length=150)
    s_address = models.TextField()
    s_phone1 = models.CharField(max_length=15)
    s_contact_person = models.CharField(max_length=120)
    s_email = models.CharField(max_length=120)
    s_phone2 = models.CharField(max_length=15)
    s_is_deleted = models.CharField(max_length=1)
    s_added = models.DateTimeField()
    s_updated = models.DateTimeField()
    s_created_by = models.IntegerField()
    s_updated_by = models.IntegerField()
    s_status = models.CharField(max_length=15)
    s_facility_id = models.IntegerField()
    s_payable = models.IntegerField()
    s_receivable = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'suppliers'



class Title(models.Model):
    title_id = models.AutoField(primary_key=True)
    title_name = models.CharField(max_length=9)
    title_status = models.CharField(max_length=12)
    title_created_on = models.DateTimeField()
    title_created_by = models.IntegerField()
    title_modified_on = models.DateTimeField()
    title_modified_by = models.IntegerField()
    title_is_deleted = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = 'title'



class Zone(models.Model):
    z_id = models.AutoField(primary_key=True)
    z_name = models.CharField(max_length=100)
    z_created_on = models.DateTimeField()
    z_is_deleted = models.CharField(max_length=1)
    z_status = models.CharField(max_length=15)
    z_created_by = models.IntegerField()
    z_modified_on = models.DateTimeField()
    z_modified_by = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'zone'