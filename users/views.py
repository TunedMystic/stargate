from django.http import HttpResponse


def index(request):
    # import pdb; pdb.set_trace()
    return HttpResponse("Hello user, welcome to the dashboard.")