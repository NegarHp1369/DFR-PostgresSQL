from rest_framework.routers import DefaultRouter
from django.urls import path, include
from .views import ProductViewSet, OrderViewSet, CustomerViewSet, OrderItemViewSet, SupplierViewSet, CategoryViewSet


router = DefaultRouter()
router.register(r'products', ProductViewSet)
router.register(r'orders', OrderViewSet)
router.register(r'customers', CustomerViewSet)
router.register(r'suppliers', SupplierViewSet)
router.register(r'order_items', OrderItemViewSet)
router.register(r'categories', CategoryViewSet)






urlpatterns = [
    path('', include(router.urls)),
]
