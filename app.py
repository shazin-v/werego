import random
from datetime import datetime
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from flask import Flask, render_template, url_for, request, redirect, session, jsonify, flash
from DBConnection import Db

app = Flask(__name__)
app.secret_key="123"



#//////////////////////////////////////////////////////////////COMMON/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


@app.route('/')
def home():
    return render_template('index.html')


@app.route('/find_your_charger')
def find_your_charger():
    return render_template('find_your_charger.html')

@app.route('/about')
def about():
    return render_template('about.html')




@app.route('/contact_us', methods=['GET', 'POST'])
def contact_us():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        feedback = request.form['message']
        db = Db()
        sql = db.insert("INSERT INTO contact_us (Name, Email, feedback_date, feedback) VALUES (%s, %s, NOW(), %s)", (name, email, feedback))
        return render_template('contact_us.html', message='Thank you for your feedback!')
    else:
        return render_template('contact_us.html')





@app.route('/forgot_password', methods=['GET', 'POST'])
def forgot_password():
    if request.method == "POST":
        # Validate email input
        email = request.form.get('email', '').strip()
        if not email:
            return "Email is required", 400
        if not re.match(r"[^@]+@[^@]+\.[^@]+", email):
            return "Invalid email format", 400

        # Check if email exists in database
        db = Db()
        user = db.selectOne("SELECT * FROM login WHERE email=%s", (email,))
        if not user:
            return "Sorry, we couldn't find an account associated with that email address.", 400

         # Send email with passw    ord reset instructions or link
        password = user['password']
        sender_email = "a97298570@gmail.com"
        sender_password = "56B50C32C322385ED3009518610638823005"
        recipient_email = email
        subject = "Password Reset for EV STATION BOOKING WEBSITE"
        content = "Your password for EV STATION BOOKING WEBSITE has been reset. Please login with your new password."
        host = "smtp.gmail.com"
        port = 465
        message = MIMEMultipart()
        message['From'] = Header(sender_email)
        message['To'] = Header(recipient_email)
        message['Subject'] = Header(subject)
        message.attach(MIMEText(content, 'plain', 'utf-8'))
        try:
            with smtplib.SMTP_SSL(host, port) as server:            
                server.login("a97298570@gmail.com", "56B50C32C322385ED3009518610638823005")
                server.sendmail("a97298570@gmail.com", recipient_email, message.as_string())

                return "An email has been sent to your email address with instructions on how to reset your password."
        except smtplib.SMTPAuthenticationError:
            return "Failed to authenticate with the email server. Please check your email credentials.", 500
        except smtplib.SMTPException as e:
            return f"An error occurred while sending the email: {str(e)}", 500

    return render_template("forgot_password.html")








@app.route('/login',methods=['GET', 'POST'])
def login():
    if  'user_type' in session and session['user_type'] == "admin":
        return redirect('/admin-home')

    if request.method == "POST":
        print('form ', request.form)
        username = request.form['username']
        password = request.form['password']
        db = Db()
        ss = db.selectOne("select * from login where username='" + username + "'and password='" + password + "'")
        if ss is not None:
            session['head'] = ""
            session['username'] = username # set the username key in the session
            if ss['usertype'] == 'admin':
                session['user_type'] = 'admin'
                return redirect('/admin-home')

            elif ss['usertype'] == 'user':
                session['user_type'] = 'user'
                session['uid'] = ss['login_id']
                return redirect('/user-dashboard')
            else:
                return '''<script>alert('user not found');window.location="/login"</script>'''
        else:
            return '''<script>alert('user not found');window.location="/login"</script>'''
    return render_template("login.html")


@app.route('/logout')
def logout():
    session.pop('username',None)
    session.pop('user_type',None)
    session.pop('log',None)
    session.pop('usertype',None)

    return redirect('/login')



    # =========================

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == "POST":
        username = request.form['signupUsername']
        email = request.form['email']
        password = request.form['password']
        confirmPassword = request.form['confirmPassword']

        # Perform form validation
        if username.strip() == '':
            return redirect(url_for('register', error='Please enter a username', form_id='createAccount'))

        if email.strip() == '':
            return redirect(url_for('register', error='Please enter an email address', form_id='createAccount'))

        if password.strip() == '':
            return redirect(url_for('register', error='Please enter a password', form_id='createAccount'))

        if confirmPassword.strip() == '':
            return redirect(url_for('register', error='Please confirm the password', form_id='createAccount'))

        if password != confirmPassword:
            return redirect(url_for('register', error='Passwords do not match', form_id='createAccount'))

        db = Db()
        qry = db.insert("INSERT INTO login (username, email, password, usertype) VALUES (%s, %s,%s, 'user')", (username, email, password))

        return '<script>alert("User registered"); window.location.href="/login";</script>'
    else:
        error = request.args.get('error')  # Get the error message from the URL parameters
        return render_template("login.html", error=error , form_id='createAccount')






#////////////////////////////////////////////////////////////ADMIN///////////////////////////////////////////////////////////////////////////////////////////////////////////////////



@app.route('/admin-home')
def admin_home():
    print('session ', session)
    if session['user_type'] == 'admin':
        username = session['username'] # get the username from the session
        return render_template('admin/admin-login-dashboard.html', username=username)
    else:
        return redirect('/')



@app.route('/Manage_station')
def Manage_station():
    print('session ', session)
    if session['user_type'] == 'admin':
        db=Db()
        qry=db.select("select id, station_name, address, city, charger_type, available_ports, status from admin_charging_station_list")
        return render_template("admin/Manage_station.html",data=qry)
    else:
        return redirect('/')

# =============================contact_us
@app.route('/view_feedback')
def view_feedback():
    print('session ', session)
    if session['user_type'] == 'admin':
        db=Db()
        ss=db.select("select * from contact_us")
        return render_template("admin/view_feedback.html",data=ss)
    else:
        return redirect('/')

# 


# ==================delete station=======
@app.route("/adm_delete_station/<station_name>")
def adm_delete_station(station_name):
    print('session ', session)
    if session['user_type'] == 'admin':
        db = Db()
        qry = db.delete("delete from admin_charging_station_list where id='"+station_name+"'")
        return '''<script>alert('station deleted');window.location="/Manage_station"</script>'''
    else:
        return redirect('/')
# =======================================





@app.route("/adm_delete_feedback/<feedback>")
def adm_delete_feedback(feedback):
    print('session ', session)
    if session['user_type'] == 'admin':
        db = Db()
        qry = db.delete("delete from contact_us where Sl_no='"+feedback+"'")
        return '''<script>alert('feedback deleted');window.location="/view_feedback"</script>'''
    else:
        return redirect('/')



@app.route('/user-list')
def user_list():
    print('session ', session)
    if session['user_type'] == 'admin':
        db=Db()
        qry = db.select("SELECT login_id, email, name FROM login WHERE usertype='user'")
        return render_template("admin/user-list.html",data=qry)
    else:
        return redirect('/')


# ==================delete user===========
@app.route("/adm_delete_user/<login_id>")
def adm_delete_user(login_id):
    print('session ', session)
    if session['user_type'] == 'admin':
        db = Db()
        qry = db.delete("delete from login where login_id='"+login_id+"'")
        return '''<script>alert('user deleted');window.location="/user-list"</script>'''
    else:
        return redirect('/')
# ==============view booking=========================

@app.route('/view_booking')
def view_booking():
    print('session ', session)
    if session['user_type'] == 'admin':
        db=Db()
        bookings = db.select("select booking_id	, booking_date, time_from, time_to, city, station_name, available_ports, login_id  from bookings  order by booking_date desc;")
        return render_template('admin/view_booking.html', bookings=bookings)
    else:
        return redirect('/')

# ===========delete booking

@app.route("/adm_delete_booking/<booking_id>")
def adm_delete_booking(booking_id):
    print('session ', session)
    if session['user_type'] == 'admin':
        db = Db()
        qry = db.delete("delete from bookings where booking_id='"+booking_id+"'")
        return '''<script>alert('booking deleted');window.location="/view_booking"</script>'''
    else:
        return redirect('/')



#//////////////////////////////////////////////////////////////USER//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

# -----------

@app.route('/user-dashboard')
def user_dashboard():
    if 'user_type' in session and session['user_type'] == "user":
        username = session['username'] # get the username from the session
        db = Db()
        bookings = db.select("select booking_id	, booking_date, time_from, time_to, city, station_name, available_ports, login_id  from bookings where login_id = '%s' order by booking_date desc;", (session['uid'],))
        # print(bookings)  # print out the value of the bookings variable
        return render_template("user/user-login-dashboard.html", bookings=bookings, username=username)
    else:
        return redirect('/')


@app.route('/usr_delete_booking/<booking_date>')
def usr_delete_booking(booking_date):
    if 'user_type' in session and session['user_type'] == "user":
        username = session['username'] # get the username from the session
        db = Db()
        
        # Delete the booking from the table
        qry = db.delete("delete from bookings WHERE booking_date = %s", (booking_date,))
         # Retrieve the updated bookings
        bookings = db.select("SELECT booking_id, booking_date, time_from, time_to, city, station_name, available_ports, login_id FROM bookings WHERE login_id = %s ORDER BY booking_date DESC", (session['uid'],))
        return '''<script>alert('booking deleted');window.location="/user-dashboard"</script>'''
    else:
         return redirect('/user-dashboard')





@app.route('/user-profile', methods=['GET', 'POST'])
def user_profile():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        password = request.form['password']
        confirm_password = request.form['confirm-password']
        
        if password != confirm_password:
            return redirect(url_for('user_profile', error='Passwords do not match'))
        
        db = Db()
        qry = db.update("UPDATE login SET name = %s, email = %s, password = %s WHERE username = %s", (name, email, password, session['username']))  # Assuming you have stored the logged-in user's username in the session
        return '<script>alert("Account details updated"); window.location.href="/user-profile";</script>'

    error = request.args.get('error')
    return render_template('user/user-profile.html', error=error)




@app.route('/user_find_your_charger', methods=['GET', 'POST'])
def user_find_your_charger():
    if 'user_type' in session and session['user_type'] == 'user':
        if request.method == 'POST':
            city = request.form.get('city')
            charger_type = request.form.get('charger_type')
            db = Db()
            qry = db.select("select station_name, address, charger_type, available_ports from admin_charging_station_list where city = %s and charger_type = %s", (city, charger_type))
            return render_template('user/station_search.html', data=qry)       
        else:
            return render_template('user/user_find_your_charger.html')
    else:
        return redirect('/')




@app.route('/search_stations', methods=['POST'])
def search_stations():
    # Get the form data
    city = request.form.get('city')
    charger_type = request.form.get('charger_type')

    # Redirect to the station_list page with the city and charger_type as URL parameters
    return redirect(url_for('station_search', city=city, charger_type=charger_type))


@app.route('/station_search', methods=['GET'])
def station_search():
    if 'user_type' in session and session['user_type'] == 'user':
        city = request.args.get('city')
        charger_type = request.args.get('charger_type')
        # Query your MySQL database using the city and charge_type variables
        db = Db()
        sql = "select * from admin_charging_station_list where city = %s and charger_type = %s"
        ss = db.select(sql, (city, charger_type))

        # Return the results to the user in a new template
        return render_template('user/station_search.html', data=ss, city=city, charger_type=charger_type)
    else:
        return redirect('/')

# ==============from station_search to booking page====================
@app.route('/booking', methods=['GET', 'POST'])
def booking():
    if request.method == 'POST':
        station_name = request.form['station_name']
        city = request.form['city']
        available_ports = request.form['available_ports']
        return redirect(url_for('booking_form',  station_name=station_name, city=city, available_ports=available_ports))
    else:
        # handle GET request to display the form
        station_name = request.args.get('station_name')
        city = request.args.get('city')
        available_ports = request.args.get('available_ports')
        return redirect(url_for('booking_form', station_name=station_name, city=city, available_ports=available_ports))

@app.route('/booking-form', methods=['GET'])
def booking_form():
    city = request.args.get('city')
    available_ports = request.args.get('available_ports')
    station_name = request.args.get('station_name')
    db = Db()
    station_data = db.select("select * from admin_charging_station_list where station_name = %s", (station_name,))
    session['station_data'] = station_data[0] if station_data else None
    if 'station_data' in session and session['station_data']:
        return render_template('/user/booking_form.html', city=city, available_ports=available_ports)
    else:
        return redirect(url_for('station_search'))



# ====================from booking to dashboard

@app.route('/book', methods=['POST'])
def book():
    if 'user_type' in session and session['user_type'] == 'user':
        # get the form data submitted by the user
        station_name = request.form['station_name']
        city = request.form['city']
        available_ports = request.form['available_ports']
        booking_date = request.form['booking_date']
        time_from = request.form['time_from']
        time_to = request.form['time_to']
        login_id = session['uid']


        db = Db()

        # get the current timestamp
        created_at = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        # insert the booking data into the MySQL table
        sql = "insert into bookings (station_name, city, available_ports, booking_date, time_from, time_to, created_at, login_id) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
        booking_id = db.insert(sql, (station_name, city, available_ports, booking_date, time_from, time_to, created_at, login_id))

        # redirect the user to their dashboard
        return render_template("user/user-login-dashboard.html", data={
            'station_name': station_name,
            'city': city,
            'available_ports': available_ports,
            'booking_date': booking_date,
            'time_from': time_from,
            'time_to': time_to,
            'created_at': created_at,
            'booking_id': booking_id
        })
    else:
        return redirect('/booking-form')




if __name__ == '__main__':        app.run(host='127.0.0.1', port=5000, debug=True)
