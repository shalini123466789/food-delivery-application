package com.tap.model;


import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart  {


    // key = menuId, so the same dish is never added as two separate rows
    private final Map<Integer, CartItem> items = new LinkedHashMap<>();

    // new dish: added. Dish already in cart: quantity increases.
    public void addItem(CartItem newItem) {
        int menuId = newItem.getMenu().getMenuId();
        CartItem existing = items.get(menuId);

        if (existing != null) {
            existing.setQuantity(existing.getQuantity() + newItem.getQuantity());
        } else {
            items.put(menuId, newItem);
        }
    }

    // sets an exact quantity; 0 or less removes the item
    public void updateItem(int menuId, int quantity) {
        if (quantity <= 0) {
            items.remove(menuId);
            return;
        }
        CartItem item = items.get(menuId);
        if (item != null) {
            item.setQuantity(quantity);
        }
    }

    public void removeItem(int menuId) {
        items.remove(menuId);
    }

    public void clear() {
        items.clear();
    }

    // read-only view so the JSP can loop but not modify the cart
    public Collection<CartItem> getItems() {
        return Collections.unmodifiableCollection(items.values());
    }

    public double getTotal() {
        double total = 0;
        for (CartItem item : items.values()) {
            total += item.getSubtotal();
        }
        return total;
    }

    // total units, for the navbar cart badge
    public int getItemCount() {
        int count = 0;
        for (CartItem item : items.values()) {
            count += item.getQuantity();
        }
        return count;
    }

    public boolean isEmpty() {
        return items.isEmpty();
    }

    // restaurant this cart belongs to, or 0 if empty
    public int getRestaurantId() {
        if (items.isEmpty()) {
            return 0;
        }
        return items.values().iterator().next().getMenu().getRestaurantId();
    }
}