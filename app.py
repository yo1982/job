from flask import Flask, jsonify, request ,render_template , session 
from flask_mysqldb import MySQL 
from flask import redirect , url_for , flash ,send_file
import mysql.connector
from datetime import datetime, timedelta
import os
from dateutil.parser import parse
from datetime import datetime
from flask import render_template, make_response
from datetime import date, timedelta
import csv
import io
from io import StringIO
from flask import make_response





app = Flask(__name__)

app.secret_key = 'chess#8'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'car_booking'
mysql = MySQL(app)


@app.route('/')
def home():
    return render_template('home.html')

# add new car
@app.route('/cars', methods=['POST'])
def add_car():
    brand = request.json['brand']
    model = request.json['model']
    year = request.json['year']
    color = request.json['color']
    daily_price = request.json['daily_price']

    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO cars (brand, model, year, color, daily_price) VALUES (%s, %s, %s, %s, %s)",
                (brand, model, year, color, daily_price))
    mysql.connection.commit()
    cur.close()

    return jsonify({"message": "Car added successfully"}), 201

# get all cars
@app.route('/cars', methods=['GET'])
def get_cars():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM cars")
    rows = cur.fetchall()
    cars = []
    for row in rows:
        car = {"id": row[0], "brand": row[1], "model": row[2], "year": row[3], "color": row[4], "daily_price": row[5]}
        cars.append(car)
    cur.close()
    return jsonify(cars), 200

# get car by id
@app.route('/cars/<int:id>', methods=['GET'])
def get_car(id):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM cars WHERE id = %s", [id])
    row = cur.fetchone()
    cur.close()
    if row:
        car = {"id": row[0], "brand": row[1], "model": row[2], "year": row[3], "color": row[4], "daily_price": row[5]}
        return jsonify(car), 200
    else:
        return jsonify({"message": "Car not found"}), 404

# update car
@app.route('/cars/<int:id>', methods=['PUT'])
def update_car(id):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM cars WHERE id = %s", [id])
    row = cur.fetchone()
    if not row:
        return jsonify({"message": "Car not found"}), 404

    brand = request.json.get('brand', row[1])
    model = request.json.get('model', row[2])
    year = request.json.get('year', row[3])
    color = request.json.get('color', row[4])
    daily_price = request.json.get('daily_price', row[5])

    cur.execute("UPDATE cars SET brand=%s, model=%s, year=%s, color=%s, daily_price=%s WHERE id=%s",
                (brand, model, year, color, daily_price, id))
    mysql.connection.commit()
    cur.close()

    return jsonify({"message": "Car updated successfully"}), 200

@app.route('/cars/int:id', methods=['DELETE'])
def delete_car(id):
   cur = mysql.connection.cursor()
   cur.execute("SELECT * FROM cars WHERE id = %s", [id])
   row = cur.fetchone()
   if not row:
      return jsonify({"message": "Car not found"}), 404
   

@app.route('/small-cars')
def small_cars():
    cur = mysql.connection.cursor()
    cur.execute("SELECT make, model, year, mileage, fuel_type, seats, price_per_day FROM cars WHERE size='small'")
    small_cars = [row[0] for row in cur.fetchall()]
    cur.close()
    if request.method == 'GET':
        if request.headers.get('accept') == 'application/json':
            return jsonify({"small_cars": small_cars})
        else:
            return render_template('small_cars.html', small_cars=small_cars)
    else:
        return 'This is the small cars page!'
    
@app.route('/family-cars')
def family_cars():
    cur = mysql.connection.cursor()
    cur.execute("SELECT make FROM cars WHERE size='medium' AND make='Toyota'")
    family_cars = [row[0] for row in cur.fetchall()]
    cur.close()
    print(family_cars)
    if request.method == 'GET':
        if request.headers.get('accept') == 'application/json':
            return jsonify({"family_cars": family_cars})
        else:
            return render_template('family_cars.html', family_cars=family_cars)
    else:
        return 'This is the family cars page!'

@app.route('/vans')
def van_cars():
    cur = mysql.connection.cursor()
    cur.execute("SELECT make FROM cars WHERE size='large' AND make='Ford'")
    van_cars = [row[0] for row in cur.fetchall()]
    cur.close()
    print(van_cars)
    if request.method == 'GET':
        if request.headers.get('accept') == 'application/json':
            return jsonify({"van_cars": van_cars})
        else:
            return render_template('vans.html', van_cars=van_cars)
    else:
        return 'This is the vans page!'

@app.route('/add_customer', methods=['GET', 'POST'])
def add_customer():
    if request.method == 'POST':
        first_name = request.form['first_name']
        last_name = request.form['last_name']
        email = request.form['email']
        phone = request.form['phone_number']

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO customers (first_name, last_name, email, phone_number) VALUES (%s, %s, %s, %s)", (first_name, last_name, email, phone))
        mysql.connection.commit()
        cur.close()

        return redirect(url_for('customers'))

    return render_template('add_customer.html')

@app.route('/customers')
def customers():
    cur = mysql.connection.cursor()
    result = cur.execute("SELECT * FROM customers")
    if result > 0:
        customers = cur.fetchall()
        print(customers) # add this line
        return render_template('customers.html', customers=customers)
    else:
        return render_template('customers.html', customers=None)

@app.route("/update-customer", methods=["GET"])
def update_customer_get():
    # Get customer id from query parameter
    customer_id = request.args.get("customer_id")

    # Query database for customer record
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM customers WHERE customer_id = %s", (customer_id,))
    customer = cur.fetchone()

    # Render update customer form with pre-filled data
    return render_template("update_customer.html", customer=customer)


@app.route("/update-customer", methods=["POST"])
def update_customer_post():
    # Get form data from request
    id = request.form["customer_id"]
    first_name = request.form["first_name"]
    last_name = request.form["last_name"]
    email = request.form["email"]
    phone_number = request.form["phone_number"]

    # Update customer record in database
    cur = mysql.connection.cursor()
    cur.execute("UPDATE customers SET first_name = %s, last_name = %s, email = %s, phone_number = %s WHERE customer_id = %s", (first_name, last_name, email, phone_number, id))
    mysql.connection.commit()

    # Redirect to customers page after update
    return redirect(url_for("customers"))



@app.route("/delete-customer", methods=['GET'])
def delete_customer_get():
    # If the request method is GET, show the delete customer form
    customer_id = request.args.get("customer_id")
        # Check if customer exists in database


    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM customers WHERE customer_id = %s", (customer_id,))
    customer = cur.fetchone()

    return render_template("delete_customer.html", customer=customer)

@app.route("/delete-customer", methods=['POST'])
def delete_customer_post():
    # Get form data from request
    customer_id = request.form["customer_id"]
    # Delete customer record from database

    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM customers WHERE customer_id = %s", (customer_id,))
    mysql.connection.commit()
    # Redirect to customers page after deletion
    return redirect(url_for("customers"))

@app.route("/book-car", methods=["GET"])
def show_book_car_form():
    return render_template("book_car.html")

@app.route("/book-car", methods=["POST"])
def process_book_car_form():
    # Get form data
    customer_name = request.form["customer_name"]
    car_type = request.form["car_type"]
    pickup_date_str = request.form["pickup_date"]
    return_date_str = request.form["return_date"]
    pickup_location = request.form["pickup_location"]
    return_location = request.form["return_location"]
    payment_method = request.form['payment_method']

    # Parse pickup and return dates
    try:
        pickup_date = parse(pickup_date_str)
        return_date = parse(return_date_str)
    except ValueError:
        error_message = "Invalid date format. Please use the format yyyy-mm-dd."
        return render_template("error.html", error_message=error_message)

    # Check that pickup date is not more than 7 days in advance
    max_pickup_date = datetime.now() + timedelta(days=7)
    if pickup_date > max_pickup_date:
        error_message='Pickup date cannot be more than 7 days in advance.'
        return render_template('error.html', error_message=error_message)

    # Calculate duration of rental in days
    rental_duration = (return_date - pickup_date).days

    # Check if rental duration is more than a week (7 days)
    if rental_duration > 7:
        error_message = 'Sorry, rentals cannot exceed 7 days.'
        return render_template('error.html', error_message=error_message)

    # Calculate price
    days = (return_date - pickup_date).days + 1
    if car_type == 'small':
        price = days * 50
    elif car_type == 'family':
        price = days * 80
    elif car_type == 'van':
        price = days * 120

    # Store booking details in session
    booking = {
        'customer_name': customer_name,
        'car_type': car_type,
        'pickup_date': pickup_date,
        'return_date': return_date,
        'pickup_location': pickup_location,
        'return_location': return_location,
        'price': price,
        'payment_method': payment_method,
        'booking_date': datetime.now().strftime('%Y-%m-%d')
    }
    session['booking'] = booking

    # Insert booking details into database
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO bookings (customer_name, car_type, pickup_date, return_date, pickup_location, return_location, price, payment_method, booking_date) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)", (customer_name, car_type, pickup_date, return_date, pickup_location, return_location, price, payment_method, booking['booking_date']))
    mysql.connection.commit()
    cur.close()

    # Render booking confirmation page
    return redirect(url_for('confirmation_booking', booking=booking))

    
    
@app.route("/booking-confirmation")
def confirmation_booking():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM bookings ORDER BY id DESC LIMIT 1")
    booking = cur.fetchone()
    mysql.connection.commit()
    cur.close()

    return render_template("confirmation_booking.html", booking=booking)






@app.route('/pay-invoice', methods=['POST'])
def pay_invoice():
    # Retrieve the booking details from the request object
    customer_name = request.form['customer_name']
    car_type = request.form['car_type']
    pickup_date = request.form['pickup_date']
    return_date = request.form['return_date']
    pickup_location = request.form['pickup_location']
    return_location = request.form['return_location']
    price = request.form['price']
    payment_method = request.form['payment_method']

    # Generate invoice message
    invoice_message = 'Thank you, %s, for your payment of $%.2f for your %s rental from %s to %s. Your pickup location is %s and return location is %s. Your payment method is %s. Enjoy your trip!' % (customer_name, float(price), car_type, pickup_date, return_date, pickup_location, return_location, payment_method)

    # Return the invoice message
    return invoice_message


@app.route('/employee', methods=['GET', 'POST'])
def employee():
    if request.method == 'POST' and request.form.get('action') == 'car_status':
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM cars_list")
        cars = cur.fetchall()
        cur.close()
        return render_template('employee.html', cars=cars)

    elif request.method == 'POST' and request.form.get('action') == 'daily_report':
        # Get today's date
        today = datetime.now().date()

        # Get car list
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM cars_list")
        cars = cur.fetchall()
        cur.close()

        # Get customers list for today
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM customers WHERE DATE(created_at) = %s", (today,))
        customers = cur.fetchall()
        cur.close()

        # Get bookings for today
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM bookings WHERE DATE(start_date) = %s", (today,))
        bookings = cur.fetchall()
        cur.close()

        return render_template('employee.html', cars=cars, customers=customers, bookings=bookings)

    return render_template('employee.html')

@app.route('/get-customer', methods=['GET', 'POST'])
def get_customer():
    if request.method == 'POST':
        # Get the form data
        last_name = request.form['last_name']
        phone_number = request.form['phone_number']
        
        
        # Build the SQL query based on the form data
        query = "SELECT * FROM customers WHERE 1=1"
        if phone_number:
            query += f" AND phone_number = {phone_number}"
        if last_name:
            query += f" AND last_name = '{last_name}'"
        
        # Execute the query and fetch the results
        cur = mysql.connection.cursor()
        cur.execute(query)
        customers = cur.fetchall()
        cur.close()
        
        # Render the results template with the data
        return render_template('customer_results.html', customers=customers)
    
    # Render the form template for GET requests
    return render_template('get_customer.html', action='get_customer')

@app.route('/daily-report', methods=['GET', 'POST'])
def daily_report():
    if request.method == 'POST' and request.form.get('action') == 'Generate Report':
        date = request.form.get('date')
        formatted_date = datetime.strptime(date, '%Y-%m-%d').strftime('%m/%d/%Y')
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM cars_list")
        cars = cur.fetchall()
        cur.execute("SELECT * FROM customers")
        customers = cur.fetchall()
        cur.execute("SELECT * FROM bookings WHERE booking_date=%s", [date])
        bookings = cur.fetchall()
        cur.close()
        total_bookings = len(bookings)
        report_data = True
    else:
        report_data = False
        cars = []
        customers = []
        bookings = []
        total_bookings = 0
        formatted_date = None

    dates = get_dates()  # function to get list of dates for dropdown menu

    return render_template('daily-report.html', report_data=report_data, cars=cars, customers=customers, bookings=bookings, total_bookings=total_bookings, formatted_date=formatted_date)

def get_dates():
    dates = []
    today = date.today()
    for i in range(7):
        dates.append(today + timedelta(days=i))
    return dates





   
















@app.route("/")
def index():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM bookings")
    bookings = cursor.fetchall()
    cursor.close()
    return render_template("index.html", bookings=bookings)











if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)









