
import streamlit as st
import pandas as pd
import plotly.express as px

st.set_page_config(page_title="Adidas US Sales Dashboard", layout="wide")

raw = pd.read_excel("data/Adidas_US_Sales.xlsx", header=3)
raw = raw.loc[:, ~raw.columns.astype(str).str.contains("^Unnamed")]
df = raw.copy()

df["Invoice Date"] = pd.to_datetime(df["Invoice Date"])

st.title("Adidas US Sales Dashboard")

c1,c2,c3 = st.columns(3)
c1.metric("Total Sales", f"${df['Total Sales'].sum():,.0f}")
c2.metric("Total Profit", f"${df['Operating Profit'].sum():,.0f}")
c3.metric("Units Sold", f"{df['Units Sold'].sum():,.0f}")

region = df.groupby("Region")["Total Sales"].sum().reset_index()
st.plotly_chart(px.bar(region,x="Region",y="Total Sales",title="Sales by Region"), use_container_width=True)

product = df.groupby("Product")["Total Sales"].sum().reset_index()
st.plotly_chart(px.bar(product,x="Product",y="Total Sales",title="Sales by Product"), use_container_width=True)

monthly = df.groupby(df["Invoice Date"].dt.to_period("M"))["Total Sales"].sum().reset_index()
monthly["Invoice Date"]=monthly["Invoice Date"].astype(str)
st.plotly_chart(px.line(monthly,x="Invoice Date",y="Total Sales",title="Monthly Sales Trend"), use_container_width=True)

retailer=df.groupby("Retailer")["Total Sales"].sum().reset_index()
st.plotly_chart(px.pie(retailer,names="Retailer",values="Total Sales",title="Retailer Contribution"), use_container_width=True)
