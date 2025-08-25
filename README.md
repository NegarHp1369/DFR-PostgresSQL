Django REST API with PostgreSQL

یک پروژه نمونه با Django + Django REST Framework (DRF) و دیتابیس PostgreSQL  
این پروژه شامل مدل‌های `Customer`, `Product`, `Order`, و `OrderItem` است و از طریق API می‌توان عملیات CRUD را روی آن‌ها انجام داد.
SQL Examples

پوشه‌ی sql/ شامل کوئری‌های SQL تمرینی است (Join, Union, Trigger, Function و 



 نصب و اجرا

 ۱. کلون کردن پروژه
git clone https://github.com/username/your-repo-name.git
cd your-repo-name
۲. ساخت محیط مجازی
python3 -m venv venv
source venv/bin/activate   
۳. نصب وابستگی‌ه
pip install -r requirements.txt
۴. تنظیم دیتابیس


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'myprojectdb',
        'USER': 'myuser',
        'PASSWORD': 'mypassword',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}
۵. اجرای مایگریشن‌ها
python manage.py migrate

۶. اجرای سرور
python manage.py runserver

بعد از اجرای سرور، آدرس پایه:
http://127.0.0.1:8000/api/

Customers

GET /api/customers/ → لیست مشتری‌ها

POST /api/customers/ → ساخت مشتری جدید

GET /api/customers/{id}/ → گرفتن اطلاعات مشتری

PUT /api/customers/{id}/ → آپدیت کامل

PATCH /api/customers/{id}/ → آپدیت بخشی

DELETE /api/customers/{id}/ → حذف مشتری

Products

GET /api/products/

POST /api/products/

GET /api/products/{id}/

PUT /api/products/{id}/

DELETE /api/products/{id}/

Orders

GET /api/orders/

POST /api/orders/

Order Items

GET /api/orderitems/

POST /api/orderitems/
