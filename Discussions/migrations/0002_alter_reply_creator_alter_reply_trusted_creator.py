# Generated by Django 4.0.1 on 2022-03-11 12:41

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('User', '0001_initial'),
        ('Discussions', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='reply',
            name='creator',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='User.student'),
        ),
        migrations.AlterField(
            model_name='reply',
            name='trusted_creator',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='User.organizer'),
        ),
    ]
