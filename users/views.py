from django.http import HttpResponse


def index(request):
    return HttpResponse("Hello user, welcome to the dashboard.")