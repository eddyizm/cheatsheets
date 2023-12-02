''' django notes '''
# inspect existing db and extract models
python manage.py inspectdb > test_models.py

# django orm - filter by boolean field
files = MyModel.objects.filter(downloaded=False)

# update field in record  
MyModel.objects.filter(pk=some_value).update(field1='some value')


''' Set up '''

# after creating virtual environment, install django
pip install django
django-admin --version
	
# create project  
django-admin startproject mysite

# after creating project verify django is installed correctly  
python manage.py runserver

# To create your app, make sure you’re in the same directory as **manage.py** and type this command:		
python manage.py startapp <APPNAME>

# make sure to add the app to your settings file 
# Application definition
# INSTALLED_APPS = [ <APPNAME> ]

# create super user	
python manage.py createsuperuser 
 
# change password  
python manage.py changepassword <user_name>



# database migrations 
python manage.py makemigrations <app_label>
python manage.py showmigrations <app_label>
# do I even needs this sqlmigrate command?
python manage.py sqlmigrate <app_label> <migration_name>
#push migrations
python manage.py migrate <app_label> <migration_name>
#example
python manage.py migrate app 0001_initial



''' Django Management Console	'''
# often requires these initital commands. 
import django
django.setup()	

# model examples	
class Artist (models.Model):
	name = models.CharField("artist", max_length=50)
	year_formed = models.PositiveIntegerField()

class Album (models.Model):
	name = models.CharField("album", max_length=50)
	artist = models.ForeignKey(Artist)


# Link to anchor on another page  
<a href="{% url 'anotherpage' %}#show">Page URL to show directly. </a>

# redirect on root 
from django.shortcuts import redirect

urlpatterns = [
    path('', lambda req: redirect('/myapp/')),
    path('admin/', admin.site.urls),
    path('myapp/', include('myapp.urls'))
]

# sqlite manipulation

# delete table records
def delete_everything(self):
	Reporter.objects.all().delete()


''' Default Models
password, 
last_login, 
is_superuser, 
username, 
first_name, 
last_name, email, 
is_staff, 
is_active, 
date_joined
''' 