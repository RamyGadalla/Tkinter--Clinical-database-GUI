__author__ = 'Ramy Gadalla'

import tkinter as tk
from tkinter import ttk
from tkinter import filedialog
from tkinter import messagebox
import pymysql
import os
import shutil
import db_config_file
import db_functions as db

rows = None
num_of_rows = None
row_counter = 0


# === defining an event  ===============
def on_tab_selected(event):

    global blank_textboxes_tab_two

    selected_tab = event.widget.select()
    tab_text = event.widget.tab(selected_tab, "text")
    if tab_text == "Trials Info":
        load_database_results()

    if tab_text == "Adding New Trial":
        blank_textboxes_tab_two = True


# == load database result =======
def load_database_results():
    global rows
    global num_of_rows


    try:
        con = db.open_database()
    except Exception:
        messagebox.showinfo("Database connection error")
        exit()
    messagebox.showinfo("Connected to Database", "DB Connection OK")
    try:
        sql = "SELECT * FROM trials_info"
        num_of_rows, rows = db.query_database(con, sql, None)
    except Exception:
        messagebox.showinfo("Error querying the database")
        raise Exception

    return True


def database_error(err):
    messagebox.showinfo("Error", err)
    return False



def scroll_forward():
    global row_counter
    global num_of_rows

    row_counter = row_counter + 1
    trialName.set(rows[row_counter][0])
    identifier.set(rows[row_counter][1])
    intervention.set(rows[row_counter][2])
    case.set(rows[row_counter][3])
    phase.set(rows[row_counter][4])
    sponsor.set(rows[row_counter][5])
    PI.set(rows[row_counter][6])
    institute.set(rows[row_counter][7])
    location.set(rows[row_counter][8])
    cohort.set(rows[row_counter][9])
    buttonBack.state(['!disabled'])
    if row_counter >= (num_of_rows - 1):
        buttonForward.state(['disabled'])


def scroll_back():
    global row_counter
    global num_of_rows


    row_counter = row_counter - 1
    trialName.set(rows[row_counter][0])
    identifier.set(rows[row_counter][1])
    intervention.set(rows[row_counter][2])
    case.set(rows[row_counter][3])
    sponsor.set(rows[row_counter][5])
    PI.set(rows[row_counter][6])
    institute.set(rows[row_counter][7])
    location.set(rows[row_counter][8])
    cohort.set(rows[row_counter][9])
    buttonForward.state(['!disabled'])
    if row_counter ==0:
        buttonBack.state(['disabled'])


#===== Functions for Tab2 adding new trial =========#

def insert_into_database(trialName, identifier, intervention, case, phase, sponsor, PI, institute, location, cohort):

    try:
        con = db.open_database()
    except Exception as e:
        messagebox.showinfo("Database connection error", e)
        exit()
    "INSERT INTO students (first_name, last_name, grade) VALUES (%s, %s, %s)"
    try:
         sql = "INSERT INTO trials_info (trial_name, trial_identifier, intervention, `case`, `phase`, sponsor, principal_investigator, institute,  study_location, no_of_cohort) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
         vals = (trialName, identifier, intervention, case, phase, sponsor, PI, institute, location, cohort)
         print(sql)
         db.insert_database(con, sql, vals)
    except Exception as e:
        messagebox.showinfo("Error inserting record in database")
        raise db.DatabaseError(e)


def add_new_record():

    global blank_textboxes_tab_two
    blank_textbox_count = 0

    if trialNameTabTwo.get() == "":

        blank_textbox_count = blank_textbox_count + 1

    if identifierTabTwo.get() == "":

        blank_textbox_count = blank_textbox_count + 1

    if interventionTabTwo.get() == "":

        blank_textbox_count = blank_textbox_count + 1

    if caseTabTwo.get() == "":
        blank_textbox_count = blank_textbox_count + 1

    if sponsorTabTwo.get() == "":
        blank_textbox_count = blank_textbox_count + 1

    if PITabTwo.get() == "":
        blank_textbox_count = blank_textbox_count + 1

    if instituteTabTwo.get() == "":
        blank_textbox_count = blank_textbox_count + 1

    if locationTabTwo.get() == "":
        blank_textbox_count = blank_textbox_count + 1

    if cohortTabTwo.get() == "":
        blank_textbox_count = blank_textbox_count + 1

    if blank_textbox_count > 0:
        blank_textboxes_tab_two = True
        messagebox.showinfo("Database Error", "Blank Text boxes")

    elif blank_textbox_count == 0:
        blank_textboxes_tab_two = False
        try:
            insert_into_database(trialNameTabTwo.get(), identifierTabTwo.get(), interventionTabTwo.get(), caseTabTwo.get(), phaseTabTwo.get(), sponsorTabTwo.get(), PITabTwo.get(), instituteTabTwo.get(), locationTabTwo.get(), cohortTabTwo.get())
        except Exception as e:
            messagebox.showinfo("Database Error", e)

        messagebox.showinfo("Database", "Record Added to Database")

########## Function tab 3 - Search #####################
def search_records_for_patients():
    global rows
    global num_of_rows

    trial_patient_ID = option_s


    try:
        con = db.open_database()
    except Exception:
        messagebox.showinfo("Database connection error")
        exit()

    try:
        sql = "SELECT processing.trial_pt_ID, processing.visit, transdata_info.sample_type, processing.date_recieved, processing.blood, processing.core_biopsy, processing.no_core_biopsy, transdata_info.scRNA, transdata_info.FLOW, transdata_info.CyTOF FROM processing INNER JOIN transdata_info ON processing.trial_pt_ID = transdata_info.Patient_ID WHERE processing.trial_pt_ID = %s"

        vals = option_s.get()
        num_of_rows, rows = db.query_database(con, sql, vals)
        print(rows)
    except db.DatabaseError:
        messagebox.showinfo("Error querying the database")
        raise Exception
    return True

def display_query_results():
    global rows
    global num_of_rows

    success = search_records_for_patients()

    table = ttk.Treeview(tab3, columns=(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), height=10, show="headings")

    table.heading(1, text="Patient ID")
    table.heading(2, text="VISIT")
    table.heading(3, text="SAMPLE")
    table.heading(4, text="DATE Recieved")
    table.heading(5, text="Blood")
    table.heading(6, text="Core BIOPSY")
    table.heading(7, text="NO. CORE")
    table.heading(8, text="scRNA")
    table.heading(9, text="FLOW")
    table.heading(10, text="CyTOF")


    table.column(1, width=100)
    table.column(2, width=50)
    table.column(3, width=70)
    table.column(4, width=100)
    table.column(5, width=50)
    table.column(6, width=50)
    table.column(7, width=100)
    table.column(9, width=50)
    table.column(9, width=50)
    table.column(10, width=50)


    table.grid(row=1, column=0, columnspan = 40, padx=15, pady=15)

    for row in rows:
        table.insert('', 'end', values=(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9]))


# ============= function to populate the drop down menu  ===========

def load_patients_menu_results():
    patientList = []

    try:
        con = pymysql.connect(host=db_config_file.DB_SERVER,
                              user=db_config_file.DB_USER,
                              password=db_config_file.DB_PASS,
                              database=db_config_file.DB,
                              port=db_config_file.DB_PORT)

        sql = "SELECT trial_pt_ID FROM processing order by trial_pt_ID"
        cursor = con.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        num_of_rows = cursor.rowcount


        for row in rows:
            data = "%s" % (row[0])
            patientList.append(data)

        cursor.close()
        con.close()
        messagebox.showinfo("Connected to Database", "DB Connection OK")

    except pymysql.InternalError as e:
        has_loaded_successfully = database_error(e)
    except pymysql.OperationalError as e:
        has_loaded_successfully = database_error(e)
    except pymysql.ProgrammingError as e:
        has_loaded_successfully = database_error(e)
    except pymysql.DataError as e:
        has_loaded_successfully = database_error(e)
    except pymysql.IntegrityError as e:
        has_loaded_successfully = database_error(e)
    except pymysql.NotSupportedError as e:
        has_loaded_successfully = database_error(e)

    return patientList


#=====================================
def _quit():
    form.quit()
    form.destroy()



#======================== TAB 1 code =======================
# ======= Browse Clinical Trials Table ========

#======================== MAIN APPLICATION =======================
# ==== form code ============
form = tk.Tk()
form.title("Clinical Trials Database")
form.geometry("1000x800")
tab_parent = ttk.Notebook(form)

tab1 = ttk.Frame(tab_parent)
tab2 = ttk.Frame(tab_parent)
tab3 = ttk.Frame(tab_parent)

tab_parent.bind("<<NotebookTabChanged>>", on_tab_selected)

tab_parent.add(tab1, text="Trials Info")
tab_parent.add(tab2, text="Adding New Trial")
tab_parent.add(tab3, text="Patient Search")


image = tk.PhotoImage(file="./TIP-logo.png")
image = image.subsample(5)
label = tk.Label(tab_parent, image=image)
label.pack(side="bottom", fill="x")




##### CODE FOR TAB 1 ############################################
# ====== SET UP STRING VARS FOR TAB 1=========
trialName = tk.StringVar()
identifier = tk.StringVar()
intervention = tk.StringVar()
case = tk.StringVar()
phase = tk.StringVar()
sponsor = tk.StringVar()
PI = tk.StringVar()
institute = tk.StringVar()
location = tk.StringVar()
cohort = tk.StringVar()

# === widgets for TAB ONE
trialNameLabelTabOne = tk.Label(tab1, text="Trial Name: ")
identifierLabelTabOne = tk.Label(tab1, text="Identifier: ")
interventionLabelTabOne = tk.Label(tab1, text="Intervention: ")
caseLabelTabOne = tk.Label(tab1, text="Case: ")
phaseLabelTabOne = tk.Label(tab1, text="Phase: ")
sponsorLabelTabOne = tk.Label(tab1, text="Sponor: ")
PILabelTabOne = tk.Label(tab1, text="Principal Investigator:: ")
instituteLabelTabOne = tk.Label(tab1, text="Institute: ")
locationLabelTabOne = tk.Label(tab1, text="Study Location: ")
cohortLabelTabOne = tk.Label(tab1, text="Number of cohorts: ")

trialNameEntryTabOne = tk.Entry(tab1, textvariable=trialName)
identifierEntryTabOne = tk.Entry(tab1, textvariable=identifier)
interventionEntryTabOne = tk.Entry(tab1, textvariable=intervention)
caseEntryTabOne = tk.Entry(tab1, textvariable=case)
phaseEntryTabOne = tk.Entry(tab1, textvariable=phase)
sponsorEntryTabOne = tk.Entry(tab1, textvariable=sponsor)
PIEntryTabOne = tk.Entry(tab1, textvariable=PI)
instituteEntryTabOne = tk.Entry(tab1, textvariable=institute)
locationEntryTabOne = tk.Entry(tab1, textvariable=location)
cohortEntryTabOne = tk.Entry(tab1, textvariable=cohort)

buttonForward = ttk.Button(tab1, text="Forward", command=scroll_forward)
buttonBack = ttk.Button(tab1, text="Back", command=scroll_back) # state = disabled


#=============== Add Widgets to GRID on TAB ONE
trialNameLabelTabOne.grid(row=0, column=0, padx=15, pady=15)
trialNameEntryTabOne.grid(row=0, column=1, padx=15, pady=15)

identifierLabelTabOne.grid(row=1, column=0, padx=15, pady=15)
identifierEntryTabOne.grid(row=1, column=1, padx=15, pady=15)

interventionLabelTabOne.grid(row=2, column=0, padx=15, pady=15)
interventionEntryTabOne.grid(row=2, column=1, padx=15, pady=15)

caseLabelTabOne.grid(row=3, column=0, padx=15, pady=15)
caseEntryTabOne.grid(row=3, column=1, padx=15, pady=15)

phaseLabelTabOne.grid(row=4, column=0, padx=15, pady=15)
phaseEntryTabOne.grid(row=4, column=1, padx=15, pady=15)

sponsorLabelTabOne.grid(row=5, column=0, padx=15, pady=15)
sponsorEntryTabOne.grid(row=5, column=1, padx=15, pady=15)

PILabelTabOne.grid(row=6, column=0, padx=15, pady=15)
PIEntryTabOne.grid(row=6, column=1, padx=15, pady=15)

instituteLabelTabOne.grid(row=7, column=0, padx=15, pady=15)
instituteEntryTabOne.grid(row=7, column=1, padx=15, pady=15)

locationLabelTabOne.grid(row=8, column=0, padx=15, pady=15)
locationEntryTabOne.grid(row=8, column=1, padx=15, pady=15)

cohortLabelTabOne.grid(row=9, column=0, padx=15, pady=15)
cohortEntryTabOne.grid(row=9, column=1, padx=15, pady=15)

buttonBack.grid(row=10, column=0, rowspan=3, padx=15, pady=15)
buttonForward.grid(row=10, column=2, rowspan=3, padx=15, pady=15)
buttonBack['state']='disabled'

# === CODE TAB TWO
trialNameTabTwo = tk.StringVar()
identifierTabTwo = tk.StringVar()
interventionTabTwo = tk.StringVar()
caseTabTwo = tk.StringVar()
sponsorTabTwo = tk.StringVar()
phaseTabTwo = tk.StringVar()
PITabTwo = tk.StringVar()
instituteTabTwo = tk.StringVar()
locationTabTwo = tk.StringVar()
cohortTabTwo = tk.StringVar()

trialNameLabelTabTwo = tk.Label(tab2, text="Trial Name: ")
identifierLabelTabTwo = tk.Label(tab2, text="Identifier: ")
interventionLabelTabTwo = tk.Label(tab2, text="Intervention: ")
caseLabelTabTwo = tk.Label(tab2, text="Case: ")
phaseLabelTabTwo = tk.Label(tab2, text="Phase: ")
sponsorLabelTabTwo = tk.Label(tab2, text="Sponsor: ")
PILabelTabTwo = tk.Label(tab2, text="Principal Investigator: ")
instituteLabelTabTwo = tk.Label(tab2, text="Institute: ")
locationLabelTabTwo = tk.Label(tab2, text="Study Location: ")
cohortLabelTabTwo = tk.Label(tab2, text="NUmber of cohort: ")

trialNameEntryTabTwo = tk.Entry(tab2, textvariable= trialNameTabTwo)
identifierEntryTabTwo = tk.Entry(tab2, textvariable=identifierTabTwo)
interventionEntryTabTwo = tk.Entry(tab2, textvariable=interventionTabTwo)
caseEntryTabTwo = tk.Entry(tab2, textvariable=caseTabTwo)
phaseEntryTabTwo = tk.Entry(tab2, textvariable=phaseTabTwo)
sponsorEntryTabTwo = tk.Entry(tab2, textvariable=sponsorTabTwo)
PIEntryTabTwo = tk.Entry(tab2, textvariable=PITabTwo)
instituteEntryTabTwo = tk.Entry(tab2, textvariable=instituteTabTwo)
locationEntryTabTwo = tk.Entry(tab2, textvariable=locationTabTwo)
cohortEntryTabTwo = tk.Entry(tab2, textvariable=cohortTabTwo)

buttonCommit = tk.Button(tab2, text="Add trial to Database", command=add_new_record)

# === LAYOUT OF WIDGETS TO GRID ON TAB TWO
trialNameLabelTabTwo.grid(row=0, column=0, padx=10, pady=10, sticky=tk.W)
trialNameEntryTabTwo.grid(row=0, column=1, padx=10, pady=10)

identifierLabelTabTwo.grid(row=1, column=0, padx=10, pady=10, sticky=tk.W)
identifierEntryTabTwo.grid(row=1, column=1, padx=10, pady=10)

interventionLabelTabTwo.grid(row=2, column=0, padx=10, pady=10, sticky=tk.W)
interventionEntryTabTwo.grid(row=2, column=1, padx=10, pady=10)

caseLabelTabTwo.grid(row=3, column=0, padx=10, pady=10, sticky=tk.W)
caseEntryTabTwo.grid(row=3, column=1, padx=10, pady=10)

phaseLabelTabTwo.grid(row=4, column=0, padx=10, pady=10, sticky=tk.W)
phaseEntryTabTwo.grid(row=4, column=1, padx=10, pady=10)

sponsorLabelTabTwo.grid(row=5, column=0, padx=10, pady=10, sticky=tk.W)
sponsorEntryTabTwo.grid(row=5, column=1, padx=10, pady=10)

PILabelTabTwo.grid(row=6, column=0, padx=10, pady=10, sticky=tk.W)
PIEntryTabTwo.grid(row=6, column=1, padx=10, pady=10)

instituteLabelTabTwo.grid(row=7, column=0, padx=10, pady=10, sticky=tk.W)
instituteEntryTabTwo.grid(row=7, column=1, padx=10, pady=10)

locationLabelTabTwo.grid(row=8, column=0, padx=10, pady=10, sticky=tk.W)
locationEntryTabTwo.grid(row=8, column=1, padx=10, pady=10)

cohortLabelTabTwo.grid(row=9, column=0, padx=10, pady=10, sticky=tk.W)
cohortEntryTabTwo.grid(row=9, column=1, padx=10, pady=10)

buttonCommit.grid(row=10, column=1, padx=15, pady=15, sticky=tk.W)


#=========== Tab 3 =================

# ====== SET UP STRING VARS =========

fName = tk.StringVar()
fam = tk.StringVar()
id = tk.StringVar()

#====== simple drop-down menu  ==========

# get the data from the database to fill in the drop down menu
# it returns a list of tuples, in this case with 2 elements

dbmenuList = load_patients_menu_results()
print(dbmenuList)

option_s = tk.StringVar()
option_s.set(dbmenuList[0]) # Set the first value to be the default option
option_s.set("Select Patient")

dropdown_s = tk.OptionMenu(tab3, option_s, *tuple(dbmenuList))


#====== search button  ==========

buttonSearch = tk.Button(tab3, text="Search", command= display_query_results)


#====== arrange label, dropdown menu and button on grid ==========

dropdown_s.grid(row=0, column=0, padx=15, pady=15)
buttonSearch.grid(row=0, column=2, padx=15, pady=15)




#================ main code
success=load_database_results()

if success:
    trialName.set(rows[0][0])
    identifier.set(rows[0][1])
    intervention.set(rows[0][2])
    case.set(rows[0][3])
    phase.set(rows[0][4])
    sponsor.set(rows[0][5])
    PI.set(rows[0][6])
    institute.set(rows[0][7])
    location.set(rows[0][8])
    cohort.set(rows[0][9])

print(option_s)
tab_parent.pack(expand=1, fill='both')
form.mainloop()