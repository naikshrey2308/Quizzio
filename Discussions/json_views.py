from django.http import HttpResponse, JsonResponse
from Discussions.models import Doubt

def upvoteDoubt(request):
    if request.method == "GET":
        key = request.GET["id"];
        doubt = Doubt.objects.get(id=key)
        doubt.upvotes += 1
        doubt.save()
        return JsonResponse({"upvotes": doubt.upvotes})