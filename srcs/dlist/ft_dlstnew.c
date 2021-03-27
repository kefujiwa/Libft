/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_dlstnew.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kefujiwa <kefujiwa@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/27 15:13:15 by kefujiwa          #+#    #+#             */
/*   Updated: 2021/03/27 15:13:51 by kefujiwa         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

t_dlist	*ft_dlstnew(void *content)
{
	t_dlist	*lst;

	lst = (t_dlist*)malloc(sizeof(t_dlist));
	if (!lst)
		return (NULL);
	lst->content = content;
	lst->prev = NULL;
	lst->next = NULL;
	return (lst);
}
