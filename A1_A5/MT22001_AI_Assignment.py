#!/usr/bin/env python
# coding: utf-8

# In[1]:


get_ipython().system('pip install pyswip')
get_ipython().system('pip install prolog ')
get_ipython().system('pip install swiplserver')
get_ipython().system('pip install nltk')


# In[2]:


import nltk
nltk.download('punkt')
nltk.download('stopwords')
nltk.download('wordnet')
nltk.download('omw-1.4')
from nltk.tokenize import word_tokenize
from nltk.stem import PorterStemmer
from nltk.corpus import stopwords
from pyswip import Prolog
import numpy as np
import string
import warnings
warnings.filterwarnings('ignore')
import os


# In[3]:


# creating the facts and writing them into the file
def writeToFileint(value , prefix):
  file = open("result.pl",'a')
  file.write(prefix)
  file.write("(")
  file.write(value)
  file.write(").\n")
  file.close()


# In[4]:


# creating the facts and writing them into the file
def writeToFile(value , prefix):
  file = open("result.pl",'a')
  file.write(prefix)
  file.write("(\'")
  file.write(value)
  file.write("\').\n")
  file.close()


# In[5]:


def interest_instructions():
    print("Thank You for selecting your Specialization")
    print("As a final step, please enter your interest in the selected domain.")
    print("Enter a value from 0 to 5, 0 meaning no interest and 5 meaning highly interested:")
    print("0 - No interest")
    print("1 - Low interest")
    print("2 - Medium interest")
    print("3 - High interest")
    print("4 - Very high interest")
    print("5 - Completely intrigued and fascinated")


# In[6]:


def yes_no(res):
     for i in res:
            if i == 'ye' or i == '1':
                return 'Y'
            else:
                return 'N'
            
            


# In[7]:


def level(result):
    for i in result:
        if i == '0' or i == 'no':
            return '0'
        elif i =='1' or i == 'low':
            return '1'
        elif i =='2' or i == 'medium':
            return '2'
        elif i =='3' or i == 'high':
            return '3'
        elif i =='4' or i == 'veryhigh':
            return '4'
        elif i =='5' or i == 'complet' or i == 'intrigu' or i == 'fascin':
            return '5'


# In[8]:


def preprocessing(interest):
    #lower casing the text
    interest = interest.lower()
    # Removing Extra white space
    interest = " ".join(interest.split())
    # Tokenize the words
    tokens = word_tokenize(interest)
    # Removing Stopwords
    sw = stopwords.words('english')
    interest = []
    for t in tokens:
        if t not in sw:
            interest.append(t)
    # Converting the words to stem (root)
    stemmer = PorterStemmer()
    interest_res=[]
    for word in interest:
        interest_res.append(stemmer.stem(word))
        
    return interest_res


# In[9]:


def ai_sub():
    interest_instructions()
    dsa = input("Amount of knowledge in Data Structure and Algorithm")
    dsa_res = preprocessing(dsa)
    selected_level = level(dsa_res)
    writeToFileint(selected_level , 'subgen1')
    la = input("Amount of knowledge in Linear Algebra")
    la_res = preprocessing(la)
    selected_level = level(la_res)
    writeToFileint(selected_level , 'subgen2')
    ca = input("Amount of knowledge in Calculus")
    ca_res = preprocessing(ca)
    selected_level = level(ca_res)
    writeToFileint(selected_level , 'subgen3')
    ps = input("Amount of knowledge in Probability and Statistics")
    ps_res = preprocessing(ps)
    selected_level = level(ps_res)
    writeToFileint(selected_level , 'subgen4')
    mlcourse = input("Have you done any Machine Learning Course")
    ml_course_res = preprocessing(mlcourse)
    ans = yes_no(ml_course_res)
    writeToFile( ans , 'cour' )
    mlproject = input("Have you done any Machine Learning Project")
    ml_project_res = preprocessing(mlproject)
    ans = yes_no(ml_project_res)
    writeToFile(ans ,'proj')
    splsub = input("Amount of knowledge in Model real-world problems, apply different learning techniques and quantitatively evaluate the performance?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub1')
    splsub = input("Amount of knowledge in various search techniques, knowledge representation, reasoning, and learning?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub2')
    splsub = input("Amount of knowledge in design and analyse algorithms using techniques like divide and conquer, greedy and dynamic programming?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub3')
    splsub = input("Amount of knowledge in learn techniques designed to be used for finding interesting patterns from data?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub4')
    splsub = input("Amount of knowledge in get hands-on experience on designing different real-world NLP models?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub5')
    splsub = input("Amount of knowledge in be able to design intelligent deep learning systems for solving the problems in your area of interest?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub6')
    


# In[10]:


def dl_sub():
    interest_instructions()
    sub = input("Amount of knowledge in Data Structure and Algorithm")
    sub_res = preprocessing(sub)
    selected_level = level(sub_res)
    writeToFileint(selected_level , 'subgen1')
    sub = input("Amount of knowledge in Database Management")
    sub_res = preprocessing(sub)
    selected_level = level(sub_res)
    writeToFileint(selected_level , 'subgen2')
    sub = input("Amount of knowledge in Graphical Representation")
    sub_res = preprocessing(sub)
    selected_level = level(sub_res)
    writeToFileint(selected_level , 'subgen3')
    sub = input("Amount of knowledge in Linear Algebra")
    sub_res = preprocessing(sub)
    selected_level = level(sub_res)
    writeToFileint(selected_level , 'subgen4')
    sub = input("Amount of knowledge in Statistics")
    sub_res = preprocessing(sub)
    selected_level = level(sub_res)
    writeToFileint(selected_level , 'subgen5')
    splsub = input("Amount of knowledge in Model real-world problems, apply different learning techniques and quantitatively evaluate the performance?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub1')
    splsub = input("Amount of knowledge in topics relating to components of a Database System including file structures, transactions, concurrency control, recovery?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub2')
    splsub = input("Amount of knowledge in design and analyse algorithms using techniques like divide and conquer, greedy and dynamic programming?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub3')
    splsub = input("Amount of knowledge in learn techniques designed to be used for finding interesting patterns from data?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub4')
    splsub = input("Amount of knowledge in get hands-on experience on designing different real-world NLP models?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub5')
    splsub = input("Amount of knowledge in get hands on learning for the development life cycle of a data warehouse?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub6')


# In[11]:


def is_sub():
    interest_instructions()
    sub = input("Amount of knowledge in Data Structure and Algorithm")
    sub_res = preprocessing(sub)
    selected_level = level(sub_res)
    writeToFileint(selected_level , 'subgen1')
    sub = input("Amount of knowledge in Computer Network")
    sub_res = preprocessing(sub)
    selected_level = level(sub_res)
    writeToFileint(selected_level , 'subgen2')
    sub = input("Amount of knowledge in Operating System")
    sub_res = preprocessing(sub)
    selected_level = level(sub_res)
    writeToFileint(selected_level , 'subgen3')
    sub = input("Amount of knowledge in Discrete Mathematics")
    sub_res = preprocessing(sub)
    selected_level = level(sub_res)
    writeToFileint(selected_level , 'subgen4')
    cncourse = input("Have you done any Computer Network Course")
    cn_course_res = preprocessing(cncourse)
    ans = yes_no(cn_course_res)
    writeToFile( ans , 'cour' )
    splsub = input("Amount of knowledge in learn about three basic principles of Modern Cryptography?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub1')
    splsub = input("Amount of knowledge in learn cryptosystems based on block ciphers, stream ciphers, public-key cryptosystems, key management, and digital signatures?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub2')
    splsub = input("Amount of knowledge in learn about Security notions, adversary powers, Perfect security, Message authentication, Public key cryptography?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub3')
    splsub = input("Amount of knowledge in various privacy and security concerns (spam, phishing, fraud nodes, identity theft) on Online Social Media?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub4')
    


# In[12]:


def ns_sub():
    interest_instructions()
    sub = input("Amount of knowledge in Data Structure and Algorithm")
    sub_res = preprocessing(sub)
    selected_level = level(sub_res)
    writeToFileint(selected_level , 'subgen1')
    sub = input("Amount of knowledge in Computer Network")
    sub_res = preprocessing(sub)
    selected_level = level(sub_res)
    writeToFileint(selected_level , 'subgen2')
    sub = input("Amount of knowledge in Operating System")
    sub_res = preprocessing(sub)
    selected_level = level(sub_res)
    writeToFileint(selected_level , 'subgen3')
    sub = input("Amount of knowledge in Database Management")
    sub_res = preprocessing(sub)
    selected_level = level(sub_res)
    writeToFileint(selected_level , 'subgen4')
    sub = input("Amount of knowledge in Advanced Programming")
    sub_res = preprocessing(sub)
    selected_level = level(sub_res)
    writeToFileint(selected_level , 'subgen5')
    sub = input("Amount of knowledge in Probability and Statistics")
    sub_res = preprocessing(sub)
    selected_level = level(sub_res)
    writeToFileint(selected_level , 'subgen5')
    sub = input("Amount of knowledge in Linear Algebra")
    sub_res = preprocessing(sub)
    selected_level = level(sub_res)
    writeToFileint(selected_level , 'subgen6')
    
    splsub = input("Amount of knowledge in Model real-world problems, apply different learning techniques and quantitatively evaluate the performance?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub1')
    splsub = input("Amount of knowledge in various search techniques, knowledge representation, reasoning, and learning.?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub2')
    splsub = input("Amount of knowledge in design and analyse algorithms using techniques like divide and conquer, greedy and dynamic programming?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub3')
    splsub = input("Amount of knowledge in learn about three basic principles of Modern Cryptography?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub4')
    splsub = input("Amount of knowledge in learn techniques designed to be used for finding interesting patterns from data?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub5')
    splsub = input("Amount of knowledge in get hands-on experience on designing different real-world NLP models?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub6')
    splsub = input("Amount of knowledge in be able to design intelligent deep learning systems for solving the problems in your area of interest?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub7')
    splsub = input("Amount of knowledge in topics relating to components of a Database System including file structures, transactions, concurrency control, recovery?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub8')
    splsub = input("Amount of knowledge in get hands on learning for the development life cycle of a data warehouse?")
    splsub_res = preprocessing(splsub)
    levelsplsub = level(splsub_res)
    writeToFileint(levelsplsub , 'sub9')
    
    


# In[13]:


def welcome():
    if os.path.exists("result.pl"): # checking if the file already exists
        os.remove("result.pl") # removing the older file
    print('----------------------------------------------------------------------------------------------')
    print('MTech Elective Advisory System 2022')
    print('----------------------------------------------------------------------------------------------')
    print('This Prolog script helps in choosing your Electives for MTech curriculum at IIIT Delhi')
    print('The advisory is generated using your level of interest in a particular domain')
    """name1 = input('Please enter your name  '),
    print(name1)
    writeToFile(name1 , 'name' )
    print('Welcome',name1 , '  The following set of questions will help me make a better prediction for your electives.')"""
    print('-> Artificial Intelligence')
    print('-> Data Engineering')
    print('-> Information Security')
    print('-> No Specialization')
    Special = input('Can you tell me one of the four specialisation that you are thinking to take ?')
    Special_res = preprocessing(Special)
    for i in Special_res:
        if i== 'artifici' or i=='intellig': 
            subject = 'Artificial Intelligence'
            writeToFile('Artificial Intelligence' , 'special')
            break
        elif i =='data' or i == 'engin' :
            subject = 'Data Engineering'
            writeToFile('Data Engineering' , 'special' )
            break
        elif i =='inform' or i == 'secur' :
            subject = 'Information Security'
            writeToFile('Information Security' ,'special')
            break
        elif i =='special' or i == 'gener' or i == 'without' :
            subject = 'No Specialization'
            writeToFile('No Specialization' ,'special')
            break
            
    if(subject == 'Artificial Intelligence'):
        ai_sub()
    if(subject == 'Data Engineering'):
        dl_sub()
    if(subject == 'Information Security'):
        is_sub()
    if(subject == 'No Specialization'):
        ns_sub()
        
        

    
    
    
   
    
   


# welcome()

# In[14]:


welcome()


# 
