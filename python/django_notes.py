''' django notes '''

# access django shell 
./manage.py shell

''' Forms ''' 

# change field name on form from model form

class PostForm(ModelForm):
	class Meta:
		labels = {
			"video": "embed"
		}


''' Set up '''

# after creating virtual environment, install django
pip install django
django-admin --version
	
# create project  
django-admin startproject mysite

# makemigrations to get started
python manage.py makemigrations 
# then 
python manage.py migrate

# after creating project verify django is installed correctly  
python manage.py runserver

# To create your app, make sure you’re in the same directory as **manage.py** and type this command:		
python manage.py startapp <APPNAME>

# Application definition
# make sure to add the app to your settings file 
# INSTALLED_APPS = [ <APPNAME> ]

# create super user	
python manage.py createsuperuser 
 
# change password  
python manage.py changepassword <user_name>

''' database migrations '''
python manage.py makemigrations <app_label>
python manage.py showmigrations <app_label>
# do I even needs this sqlmigrate command?
python manage.py sqlmigrate <app_label> <migration_name>
#push migrations
python manage.py migrate <app_label> <migration_name>
#example
python manage.py migrate app 0001_initial

# inspect existing db and extract models
python manage.py inspectdb > test_models.py


## prod gunicorn deployment
# django set up gunicorn
pip install gunicorn

# create file
# /path/to/proj/gunicorn.conf.py

### contents below ###
# bind = "0.0.0.0:8000"
# workers = 4
# keepalive = 5

# wsgi_app = "my-django-main-app.wsgi"  # replace with your main app (contains wsgi.py)


''' Django Management Console	'''
# often requires these initital commands. 
import django
django.setup()	

# Models

class Artist (models.Model):
	name = models.CharField("artist", max_length=50)
	year_formed = models.PositiveIntegerField()

class Album (models.Model):
	name = models.CharField("album", max_length=50)
	artist = models.ForeignKey(Artist)

# sub class to model for text choices
class ParentModel(models.Model):
	class Months(models.TextChoices):
	 # Actual value ↓      # ↓ Displayed on Django Admin  
		JANUARY = 'JAN', 'January'
		FEBRUARY = 'FEB', 'February'
		MARCH = 'MAR', 'March'
		APRIL = 'APR', 'April'
		MAY = 'MAY', 'May'


urlpatterns = [
    path('', lambda req: redirect('/myapp/')),
    path('admin/', admin.site.urls),
    path('myapp/', include('myapp.urls'))
]


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

# ORM 
# django orm - filter by boolean field
files = MyModel.objects.filter(downloaded=False)

# update field in record  
MyModel.objects.filter(pk=some_value).update(field1='some value')

# delete table records
def delete_everything(self):
	Reporter.objects.all().delete()


# Link to anchor on another page  
<a href="{% url 'anotherpage' %}#show">Page URL to show directly. </a>

# redirect on root 
from django.shortcuts import redirect

# redirect on login
# default URL is /accounts/profile/, set fixed url in settings
LOGIN_REDIRECT_URL = <URL PATH>
