# Customer Analytics

## Top Spenders Overview

<Grid cols=3>
  <BigNumber 
    data={top_customers}
    value=total_spent
    fmt="$,.0f"
    title="Highest Customer Spend"
  />
  <BigNumber 
    data={top_customers}
    value=customer_id
    title="Total Top Customers Tracked"
  />
  <BigNumber 
    data={top_customers_summary}
    value=avg_spend
    fmt="$,.2f"
    title="Average Spend (Top 10)"
  />
</Grid>

## Top 10 Revenue Generating Customers

<BarChart 
  data={top_customers}
  x=customer_id
  y=total_spent
  title="Top Customers by Total Spend"
  swapXY=true
/>

## Customer Spend Details

<DataTable 
  data={top_customers}
  search=true
  rows=10
>
  <Column id=customer_id title="Customer ID" />
  <Column id=total_spent title="Total Spent" fmt="$,.2f" />
</DataTable>