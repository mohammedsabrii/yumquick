
import {createClient} from 'npm:@supabase/supabase-js@2'

interface Product {
id: string,
profile_id:string
name:string,
subtitle:string,
price:number
}
interface WebhockPayload{
  type:'INSERT'
  teble: string
  record: Product
  schema:'public'
  old_record:null| Product
}
const supabase = createClient(
  Deno.env.get('SUPABASE_URL')!,
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY'),
)

Deno.serve(async (req) => {
const payload:  WebhockPayload = await req.json()
const {data} = await supabase.from('profiles').select('fcm_token').eq('id',payload.record.profile_id).single()
const fcmToken=data!.fcm_token as string
const res =await fetch( 'https://fcm.googleapis.com/v1/projects/${project_id}/message:send',{
  method:'POST',
  headers:{
    'Content-type':'application/json',
    Authorization:'BEARER ${accessToken}',
  },
  body:JSON.stringify(
   { 
    message:

   }
  ),
} ) 


  return new Response(
    JSON.stringify(data),
    { headers: { "Content-Type": "application/json" } },
  )
})

/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/yumquick_notifications' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'

*/
