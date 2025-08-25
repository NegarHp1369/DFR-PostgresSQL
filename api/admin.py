from django.contrib import admin
from .models import Product, Customer, Order, Supplier, Category, OrderItem
# Register your models here.

admin.site.register(Product)
admin.site.register(Customer)
admin.site.register(Order)
admin.site.register(OrderItem)
admin.site.register(Supplier)
admin.site.register(Category)
