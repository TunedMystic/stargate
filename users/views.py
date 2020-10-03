from django.conf import settings
from django.contrib.auth.decorators import login_required
from django.shortcuts import render


@login_required(login_url=settings.LOGIN)
def index(request):
    return render(request, 'users/dashboard.html')
