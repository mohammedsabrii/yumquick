import { createClient } from 'npm:@supabase/supabase-js@2'

const supabase = createClient(
  Deno.env.get('SUPABASE_URL')!,
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
)

Deno.serve(async (req) => {
  try {
    const { user_id } = await req.json()
    if (!user_id) {
      return new Response(JSON.stringify({ error: 'user_id is required' }), { status: 400 })
    }

    const tables = ['notifications', 'active_orders', 'carts', 'favorites']
    for (const table of tables) {
      const { error } = await supabase.from(table).delete().eq('user_id', user_id)
      if (error) console.error(`Error deleting from ${table}:`, error)
    }

    const { error: profileError } = await supabase.from('profiles').delete().eq('id', user_id)
    if (profileError) console.error('Error deleting from profiles:', profileError)

    const { error: authError } = await supabase.auth.admin.deleteUser(user_id)
    if (authError) {
      console.error('Error deleting user from auth:', authError)
      throw authError
    }

    return new Response(JSON.stringify({ success: true }), { status: 200 })
  } catch (err) {
    console.error('Unexpected error:', err)
    return new Response(JSON.stringify({ error: err.message }), { status: 500 })
  }
})
